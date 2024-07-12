import streamlit as st
import pandas as pd

df_base = pd.read_csv('test (2).csv')
try:
                noael_index = int(df_base.index[df_base['Value'] == 'NOAEL'][0])
                print(noael_index)
                #st.write(noael_index)
                truncated_df = df_base[:noael_index+2].copy()
                print('this is a truncated df')
                print(truncated_df)
                st.dataframe(truncated_df, use_container_width=True)
except:
                print('this is not a truncated df')
                st.dataframe(df_base, use_container_width=True)

def highlight_noael(value):
    if value == 'NOAEL':
        return 'color: yellow'
    else:
        return ''

# Apply the style function to highlight 'NOAEL'
styled_df = df_base.style.applymap(highlight_noael)

# Display the styled DataFrame
st.dataframe(styled_df, use_container_width=True)