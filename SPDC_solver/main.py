from SPDC_solver import *
import numpy as np
import matplotlib.pyplot as plt
from matplotlib import cm

dict = np.load("fixed_pump_30.npy",allow_pickle=True).item()
fields = dict["fields"]

dict = {0:"pump", 1:"signal vac", 2:"idler vac", 3:"signal out", 4:"idler out"}
X,Y = np.meshgrid(fields.shape[2],fields.shape[2])
for i in range(5):
    fig, ax = plt.subplots(dpi=150,subplot_kw={"projection": "3d"})
    surf = ax.plot_surface(X, Y, np.mean(np.abs(fields[:,i,:,:,-1])**2,axis=0), cmap=cm.coolwarm,linewidth=0, antialiased=False)
    fig.colorbar(surf, shrink=0.5, aspect=5)
    plt.title(f"{dict[i]}")
    plt.savefig(f"{dict[i]}.jpg")
plt.show()
