module bcm2835

  using Libdl
  push!(DL_LOAD_PATH, "/"*relpath((@__FILE__)*"/..","/"))
  lib = dlopen("./libbcm2835_1.73.so")

  bcm2835_init = dlsym(lib, "bcm2835_init")
  bcm2835_close = dlsym(lib, "bcm2835_close")
  bcm2835_version = dlsym(lib, "bcm2835_version")

  bcm2835_gpio_fsel = dlsym(lib, "bcm2835_gpio_fsel")
  bcm2835_gpio_set = dlsym(lib, "bcm2835_gpio_set")
  bcm2835_gpio_clr = dlsym(lib, "bcm2835_gpio_clr")
  bcm2835_gpio_lev = dlsym(lib, "bcm2835_gpio_lev")
  bcm2835_gpio_eds = dlsym(lib, "bcm2835_gpio_eds")

  bcm2835_delay = dlsym(lib, "bcm2835_delay")
  bcm2835_delayMicroseconds = dlsym(lib, "bcm2835_delayMicroseconds")

  bcm2835_gpio_write = dlsym(lib, "bcm2835_gpio_write")
  bcm2835_gpio_set_pud = dlsym(lib, "bcm2835_gpio_set_pud")

  bcm2835_spi_begin = dlsym(lib, "bcm2835_spi_begin")
  bcm2835_spi_end = dlsym(lib, "bcm2835_spi_end")
  bcm2835_spi_setBitOrder = dlsym(lib, "bcm2835_spi_setBitOrder")
  bcm2835_spi_setClockDivider = dlsym(lib, "bcm2835_spi_setClockDivider")
  bcm2835_spi_set_speed_hz = dlsym(lib, "bcm2835_spi_set_speed_hz")
  bcm2835_spi_setDataMode = dlsym(lib, "bcm2835_spi_setDataMode")
  bcm2835_spi_chipSelect = dlsym(lib, "bcm2835_spi_chipSelect")
  bcm2835_spi_setChipSelectPolarity = dlsym(lib, "bcm2835_spi_setChipSelectPolarity")
  bcm2835_spi_transfer = dlsym(lib, "bcm2835_spi_transfer")
  bcm2835_spi_transfernb = dlsym(lib, "bcm2835_spi_transfernb")
  bcm2835_spi_transfern = dlsym(lib, "bcm2835_spi_transfern")
  bcm2835_spi_writenb = dlsym(lib, "bcm2835_spi_writenb")
  bcm2835_spi_write = dlsym(lib, "bcm2835_spi_write")

  bcm2835_pwm_set_clock = dlsym(lib, "bcm2835_pwm_set_clock")
  bcm2835_pwm_set_mode = dlsym(lib, "bcm2835_pwm_set_mode")
  bcm2835_pwm_set_range = dlsym(lib, "bcm2835_pwm_set_range")
  bcm2835_pwm_set_data = dlsym(lib, "bcm2835_pwm_set_data")

  init() = @ccall $bcm2835_init()::Cint
  close() = @ccall $bcm2835_close()::Cint
  version() = @ccall $bcm2835_version()::Cint

  gpio_fsel(pin, mode) = @ccall $bcm2835_gpio_fsel(pin::UInt8, mode::UInt8)::Cvoid
  gpio_set(pin) = @ccall $bcm2835_gpio_set(pin::UInt8)::Cvoid
  gpio_clr(pin) = @ccall $bcm2835_gpio_clr(pin::UInt8)::Cvoid
  gpio_lev(pin) = @ccall $bcm2835_gpio_lev(pin::UInt8)::UInt8
  gpio_eds(pin) = @ccall $bcm2835_gpio_eds(pin::UInt8)::UInt8

  delay(millis) = @ccall $bcm2835_delay(millis::UInt32)::Cvoid
  delayMicroseconds(micros) = @ccall $bcm2835_delayMicroseconds(micros::UInt64)::Cvoid

  gpio_write(pin, on) = @ccall $bcm2835_gpio_write(pin::UInt8, on::UInt8)::Cvoid
  gpio_set_pud(pin, pud) = @ccall $bcm2835_gpio_set_pud(pin::UInt8, pud::UInt8)::Cvoid

  spi_begin() = @ccall $bcm2835_spi_begin()::Cint
  spi_end() = @ccall $bcm2835_spi_end()::Cvoid
  spi_setBitOrder(order) = @ccall $bcm2835_spi_setBitOrder(order::UInt8):: Cvoid
  spi_setClockDivider(divider) = @ccall $bcm2835_spi_setClockDivider(divider::UInt16)::Cvoid
  spi_set_speed_hz(speed_hz) = @ccall $bcm2835_spi_set_speed_hz(speed_hz::UInt32)::Cvoid
  spi_setDataMode(mode) = @ccall $bcm2835_spi_setDataMode(mode::UInt8)::Cvoid
  spi_chipSelect(cs) = @ccall $bcm2835_spi_chipSelect(cs::UInt8)::Cvoid
  spi_setChipSelectPolarity(cs, active) = @ccall $bcm2835_spi_setChipSelectPolarity(cs::UInt8, active::UInt8)::Cvoid
  spi_transfer(value) = @ccall $bcm2835_spi_transfer(value::UInt8)::UInt8
  spi_transfernb(tbuf, rbuf, len) = @ccall $bcm2835_spi_transferb(tbuf::Ptr{UInt8}, rbuf::Ptr{UInt8}, len::UInt32)::Cvoid
  spi_transfern(buf, len) = @ccall $bcm2835_spi_transfern(buf::Ptr{UInt8}, len::UInt32)::Cvoid
  spi_writenb(buf, len) = @ccall $bcm2835_spi_writenb(buf::Ptr{UInt8}, len::UInt32)::Cvoid
  spi_write(data) = @ccall $bcm2835_spi_write(data::UInt16)::Cvoid


  pwm_set_clock(divisor) = @ccall $bcm2835_pwm_set_clock(divisor::UInt32)::Cvoid
  pwm_set_mode(ch, markspace, enabled) = @ccall $bcm2835_pwm_set_mode(ch::UInt8, markspace::UInt8, enabled::UInt8):: Cvoid
  pwm_set_range(ch, range) = @ccall $bcm2835_pwm_set_range(ch::UInt8, range::UInt32):: Cvoid
  pwm_set_data(ch, data) = @ccall $bcm2835_pwm_set_data(ch::UInt8, data::UInt32)::Cvoid


end # module
