import PCA9685

pwm = PCA9685.PCA9685()
pwm.set_pwm_freq(60)

def send_pulse(channel, pulse):
  "Sends a pulse to a given channel."
  pwm.set_pwm(channel, 0, int(pulse))
