import os
import shutil

# Define paths
sway_path = './sway'
foot_path = './foot'
output_path = './themes'

# Create the output directory if it doesn't exist
if not os.path.exists(output_path):
    os.makedirs(output_path)

# Get list of theme directories in sway and foot
sway_themes = set(os.listdir(sway_path))
foot_themes = set(os.listdir(foot_path))

# Find common themes in both directories
common_themes = sway_themes.intersection(foot_themes)

# Iterate through the common themes
for theme in common_themes:
    sway_theme_path = os.path.join(sway_path, theme)
    foot_theme_path = os.path.join(foot_path, theme)
    new_theme_path = os.path.join(output_path, theme)
    
    # Create new theme directory
    if not os.path.exists(new_theme_path):
        os.makedirs(new_theme_path)
    
    # Copy and rename definitions to theme.conf
    sway_definitions_path = os.path.join(sway_theme_path, 'definitions')
    if os.path.exists(sway_definitions_path):
        shutil.copy(sway_definitions_path, os.path.join(new_theme_path, 'theme.conf'))
    
    # Copy and rename foot.ini to foot-theme.ini
    foot_ini_path = os.path.join(foot_theme_path, 'foot.ini')
    if os.path.exists(foot_ini_path):
        shutil.copy(foot_ini_path, os.path.join(new_theme_path, 'foot-theme.ini'))

print("Themes have been successfully combined.")

