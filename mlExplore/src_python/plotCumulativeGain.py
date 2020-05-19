
import matplotlib.pyplot as plt
import scikitplot as skplt

def courbeGain(y_test, y_probas):
  # ax=plt.subplot()
  skplt.metrics.plot_cumulative_gain(y_test, y_probas, title='Courbe de gain cumulée - Churns',  title_fontsize='small')
  # return (ax)
  return plt.show()
