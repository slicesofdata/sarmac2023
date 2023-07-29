# https://blogs.uoregon.edu/rclub/2016/04/05/plotting-your-logistic-regression-models/
# https://www.statology.org/plot-logistic-regression-in-r/
# https://www.danieldsjoberg.com/gtsummary/
# Logistic Graph Function
glm_modPlot = function(
    formula = NULL,
    data    = NULL, 
    family = "binomial",
    increment = .01, 
    point.col = "red", 
    xlab = "Predictor",
    ylab = "P(outcome)",
    title = "Predicted",
    add_plot = T
) {
  
  if (!is.null(formula) | !is.null(data) ) {
    
    # fit logistic regression model
    model = glm(as.formula(formula), data = data, family = family)
    
    # define new data frame that contains predictor 
    newdata = data.frame("newvar" = seq(
      from  = min(data[[names(model$model)[2]]]),
      #    from  = min(data[[gsub(".*~| ",  "", formula)]]), 
      to    = max(data[[names(model$model)[2]]]),
      #to    = max(data[[gsub(".*~| ",  "", formula)]]), 
      by    = increment))
    names(newdata)[1] = names(model$model)[2]
    #names(newdata)[1] = gsub(".*~| ",  "", formula)
    
    # use fitted model to predict values
    # newdata[[gsub("~.*| ",  "", formula)]] 
    newdata[[names(model$model)[1]]] = predict(model, newdata, type = "response")
    
    # newdata$group = "1" 
    if (length(names(model$model)) < 3) { newdata[["group"]] = "group" }
    
    p = NULL; if (add_plot) {  # plot logistic regression curve
      p <- ggplot2::ggplot(newdata, 
                           ggplot2::aes(x = .data[[names(model$model)[2]]],
                                        y = .data[[names(model$model)[1]]], 
                                        color = group
                           )) + # asking it to set the color by the variable "group" is what makes it draw three different lines
        ggplot2::geom_line(lwd = 2) +
        ggplot2::geom_point() + 
        ggplot2::ylab(ylab) + ggplot2::xlab(xlab) +
        theme_ben() +
        ggplot2::ggtitle(title)  
      #  ggplot2::labs(x = xlab, y = ylab, title = title) 
      
      
      p.se = ggplot2::ggplot(newdata, ggplot2::aes(
        x = .data[[names(model$model)[2]]],
        y = .data[[names(model$model)[1]]],
        color = group
      )) +
        ggplot2::geom_point(alpha = .5) + ggplot2::theme_classic() + 
        ggplot2::ggtitle(title) +
        ggplot2::ylab(ylab) + ggplot2::xlab(xlab) +
        ggplot2::stat_smooth(method = "glm", se = T, 
                             method.args = list(family = family), 
                             col = point.col, lwd = .75, lty = 1)
      
      
      #  plot(as.formula(formula), data = data, col = point.col)
      # lines(as.formula(formula), newdata, lwd = 2)
    }
    return(list(model     = model,
                pred.data = newdata,
                #data = data,
                plot      = p,
                plot.se   = p.se
    ))
  }
}
