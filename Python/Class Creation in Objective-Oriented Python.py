class Car:
    def __init__(self, make="unknown", model ="unknown", color ="unknown", year=-1, price=-1 ):
        self.make=make
        self.model=model
        self.color=color
        self.year =year
        self._price=price

    @property
    def price(self):
        return self._price

    @price.setter
    def price(self,p):
        if (p<=0):
            raise ValueError("Price is zero or lesss")
        print("setter for price called")
        self._price = p

    def __str__(self):
        return 'Car(make= ' + self.make + ', model ='+str(self.model)+\
                    ',color =' +str(self.color) + 'year = ' + str(self.year) +\
                    ',price =' +str(self.price)+')'

car =Car()
print("Model="+car.model)
car.price = 10000

car =Car("buick", "lesabre", "red", 2013, 1000)
print("Model="+car.model)
print("Car:",car)