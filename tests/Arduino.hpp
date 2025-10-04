#include <signal.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>

void my_handler(int s)
{
    printf("Caught signal %d\n", s);
    exit(1);
}

void setup();
void loop();

int main(int argc, char **argv)
{
    setup();

    struct sigaction sigIntHandler;
    sigIntHandler.sa_handler = my_handler;
    sigemptyset(&sigIntHandler.sa_mask);
    sigIntHandler.sa_flags = 0;

    sigaction(SIGINT, &sigIntHandler, NULL);

    while (true)
    {
        loop();
    }

    return 0;
}