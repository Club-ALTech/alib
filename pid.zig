const Input = f32;
const Output = f32;

const PID = struct {
    err_sum: f32,
    last_err: f32,
    set_point: f32,

    const K = struct {
        p: f32,
        i: f32,
        d: f32,
        /// integral time in the standard form
        pub fn Ti(self: *K) f32 {
            return self.p / self.i;
        }
        /// derivative time in the standard form
        pub fn Td(self: *K) f32 {
            return self.d/self.p;
        }
    };
};

/// functionnally the same as the parallel form, but easier to understand.
/// https://en.wikipedia.org/wiki/Proportional%E2%80%93integral%E2%80%93derivative_controller
fn standard_form(
    pid: *PID,
    k: *PID.K,
    input: Input,
    delta_time: f32, // seconds. should be regular.
) Output {
    const err = pid.set_point - input;
    pid.err_sum += err * delta_time;
    defer pid.last_err = err;
    return k.p * (err + pid.err_sum / k.Ti() + k.Td() * (err - pid.last_err) / delta_time);
}

fn parallel_form(
    pid: *PID,
    k: *PID.K,
    input: Input,
    delta_time: f32, // seconds. should be regular.
) Output {
    const err = pid.set_point - input;
    pid.err_sum += err * delta_time;
    defer pid.last_err = err;
    return k.p * err + k.i * pid.err_sum + k.d * (err - pid.last_err) / delta_time;
}
