    cars = c(1, 3, 6, 4, 9) # nolint
    trucks = c(2, 5, 4, 5, 12)
    plot(cars, type="o", col="blue", ylim=c(0,12))

    lines(trucks, type="o", pch=22, lty=2, col="red") # nolint

    title(main="Autos", col.main="red", font.main=4) # nolint