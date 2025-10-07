const Input = f32, Output = f32, KP = f32, KI = f32, KD = f32;

const PID_K = struct {
    p: KP, 
    i: f32, 
    d: f32,
};


const PID = struct {
    .err_sum: f32,
    .last_err: f32,
    .set_point: f32,
}

fn step(
    pid: *PID, 
    k: &PID_K, 
    input: Input, 
    delta_time: f32, /// f32 is just a placeholder
    ) Output {
        /// standard form implementation: https://en.wikipedia.org/wiki/Proportional%E2%80%93integral%E2%80%93derivative_controller
    const Ti = k.p/k.i
    const Td = k.d/k.p

    const error = pid.set_point - input;
    d = 

    // TODO: finish implementation according to documentation.

}