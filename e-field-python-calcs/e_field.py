COULOMB_CONSTANT = 9.0e9

class PointCharge:
    def __init__(self, x, y, charge):
        self.x = x
        self.y = y
        self.charge = charge

    def getCharge(self):
        return self.charge

    def getX(self):
        return self.x

    def getY(self):
        return self.y

class ElectricField:
    def __init__(self, charges):
        # Charges is a list of charges
        self.charges = charges

    def measure(self, x, y):
        ex = 0
        ey = 0

        for c in self.charges:
            enx = COULOMB_CONSTANT * abs(c.getCharge()) * (abs(c.getX() - x) / self.distance(x, y, c.getX(), c.getY())) / (self.distance(x, y, c.getX(), c.getY()) ** 2)
            eny = COULOMB_CONSTANT * abs(c.getCharge()) * (abs(c.getY() - y) / self.distance(x, y, c.getX(), c.getY())) / (self.distance(x, y, c.getX(), c.getY()) ** 2)

            if c.getCharge() > 0:
                if c.getX() > x:
                    ex -= enx
                else:
                    ex += enx
                if c.getY() > y:
                    ey -= eny
                else:
                    ey += eny
            elif c.getCharge() < 0:
                if c.getX() > x:
                    ex += enx
                else:
                    ex -= enx
                if c.getY() > y:
                    ey += eny
                else:
                    ey -= eny

        print(ex, ey)

    def distance(self, x1, y1, x2, y2):
        return ((x2 - x1) ** 2 + (y2 - y1) ** 2) ** (0.5)

n1 = PointCharge(3, 0, -5.0e-6)
n2 = PointCharge(0, -6, -4.0e-6)
e = ElectricField([n1, n2])
e.measure(0, 0)
