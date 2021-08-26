def escape(x):
    if(x == None):
        return None
    x = x.replace('<', '&lt;')
    x = x.replace('>', '&gt;')
    x = x.replace('&', '&amp;')
    return x