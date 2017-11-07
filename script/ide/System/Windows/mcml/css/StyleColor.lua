--[[
Title: style color
Author(s): LiPeng
Date: 2017/11/3
Desc: css style color

use the lib:
------------------------------------------------------------
NPL.load("(gl)script/ide/System/Windows/mcml/css/StyleColor.lua");
local StyleColor = commonlib.gettable("System.Windows.mcml.css.StyleColor");
StyleColor.loadPresetColor();
echo(StyleColor.ConvertTo16("#ff000080"));
echo(StyleColor.ConvertTo16("#ff0000"));
echo(StyleColor.ConvertTo16("#fff"));
echo(StyleColor.ConvertTo16("rgba(255,0,0,0.5)"));
echo(StyleColor.ConvertTo16("rgb(0,0,255)"));
echo(StyleColor.ConvertTo16("hsla(120,100%,50%,0.5)"));
echo(StyleColor.ConvertTo16("hsl(120,100%,50%)"));
------------------------------------------------------------
]]
NPL.load("(gl)script/ide/System/Core/Color.lua");
local Color = commonlib.gettable("System.Core.Color");
local StyleColor = commonlib.gettable("System.Windows.mcml.css.StyleColor");

local presetColors = {
	["AliceBlue"]="#F0F8FF",
	["AntiqueWhite"]="#FAEBD7",
	["Aqua"]="#00FFFF",
	["Aquamarine"]="#7FFFD4",
	["Azure"]="#F0FFFF",
	["Beige"]="#F5F5DC",
	["Bisque"]="#FFE4C4",
	["Black"]="#000000",
	["BlanchedAlmond"]="#FFEBCD",
	["Blue"]="#0000FF",
	["BlueViolet"]="#8A2BE2",
	["Brown"]="#A52A2A",
	["BurlyWood"]="#DEB887",
	["CadetBlue"]="#5F9EA0",
	["Chartreuse"]="#7FFF00",
	["Chocolate"]="#D2691E",
	["Coral"]="#FF7F50",
	["CornflowerBlue"]="#6495ED",
	["Cornsilk"]="#FFF8DC",
	["Crimson"]="#DC143C",
	["Cyan"]="#00FFFF",
	["DarkBlue"]="#00008B",
	["DarkCyan"]="#008B8B",
	["DarkGoldenRod"]="#B8860B",
	["DarkGray"]="#A9A9A9",
	["DarkGreen"]="#006400",
	["DarkKhaki"]="#BDB76B",
	["DarkMagenta"]="#8B008B",
	["DarkOliveGreen"]="#556B2F",
	["Darkorange"]="#FF8C00",
	["DarkOrchid"]="#9932CC",
	["DarkRed"]="#8B0000",
	["DarkSalmon"]="#E9967A",
	["DarkSeaGreen"]="#8FBC8F",
	["DarkSlateBlue"]="#483D8B",
	["DarkSlateGray"]="#2F4F4F",
	["DarkTurquoise"]="#00CED1",
	["DarkViolet"]="#9400D3",
	["DeepPink"]="#FF1493",
	["DeepSkyBlue"]="#00BFFF",
	["DimGray"]="#696969",
	["DodgerBlue"]="#1E90FF",
	["Feldspar"]="#D19275",
	["FireBrick"]="#B22222",
	["FloralWhite"]="#FFFAF0",
	["ForestGreen"]="#228B22",
	["Fuchsia"]="#FF00FF",
	["Gainsboro"]="#DCDCDC",
	["GhostWhite"]="#F8F8FF",
	["Gold"]="#FFD700",
	["GoldenRod"]="#DAA520",
	["Gray"]="#808080",
	["Green"]="#008000",
	["GreenYellow"]="#ADFF2F",
	["HoneyDew"]="#F0FFF0",
	["HotPink"]="#FF69B4",
	["IndianRed"]="#CD5C5C",
	["Indigo"]="#4B0082",
	["Ivory"]="#FFFFF0",
	["Khaki"]="#F0E68C",
	["Lavender"]="#E6E6FA",
	["LavenderBlush"]="#FFF0F5",
	["LawnGreen"]="#7CFC00",
	["LemonChiffon"]="#FFFACD",
	["LightBlue"]="#ADD8E6",
	["LightCoral"]="#F08080",
	["LightCyan"]="#E0FFFF",
	["LightGoldenRodYellow"]="#FAFAD2",
	["LightGrey"]="#D3D3D3",
	["LightGreen"]="#90EE90",
	["LightPink"]="#FFB6C1",
	["LightSalmon"]="#FFA07A",
	["LightSeaGreen"]="#20B2AA",
	["LightSkyBlue"]="#87CEFA",
	["LightSlateBlue"]="#8470FF",
	["LightSlateGray"]="#778899",
	["LightSteelBlue"]="#B0C4DE",
	["LightYellow"]="#FFFFE0",
	["Lime"]="#00FF00",
	["LimeGreen"]="#32CD32",
	["Linen"]="#FAF0E6",
	["Magenta"]="#FF00FF",
	["Maroon"]="#800000",
	["MediumAquaMarine"]="#66CDAA",
	["MediumBlue"]="#0000CD",
	["MediumOrchid"]="#BA55D3",
	["MediumPurple"]="#9370D8",
	["MediumSeaGreen"]="#3CB371",
	["MediumSlateBlue"]="#7B68EE",
	["MediumSpringGreen"]="#00FA9A",
	["MediumTurquoise"]="#48D1CC",
	["MediumVioletRed"]="#C71585",
	["MidnightBlue"]="#191970",
	["MintCream"]="#F5FFFA",
	["MistyRose"]="#FFE4E1",
	["Moccasin"]="#FFE4B5",
	["NavajoWhite"]="#FFDEAD",
	["Navy"]="#000080",
	["OldLace"]="#FDF5E6",
	["Olive"]="#808000",
	["OliveDrab"]="#6B8E23",
	["Orange"]="#FFA500",
	["OrangeRed"]="#FF4500",
	["Orchid"]="#DA70D6",
	["PaleGoldenRod"]="#EEE8AA",
	["PaleGreen"]="#98FB98",
	["PaleTurquoise"]="#AFEEEE",
	["PaleVioletRed"]="#D87093",
	["PapayaWhip"]="#FFEFD5",
	["PeachPuff"]="#FFDAB9",
	["Peru"]="#CD853F",
	["Pink"]="#FFC0CB",
	["Plum"]="#DDA0DD",
	["PowderBlue"]="#B0E0E6",
	["Purple"]="#800080",
	["Red"]="#FF0000",
	["RosyBrown"]="#BC8F8F",
	["RoyalBlue"]="#4169E1",
	["SaddleBrown"]="#8B4513",
	["Salmon"]="#FA8072",
	["SandyBrown"]="#F4A460",
	["SeaGreen"]="#2E8B57",
	["SeaShell"]="#FFF5EE",
	["Sienna"]="#A0522D",
	["Silver"]="#C0C0C0",
	["SkyBlue"]="#87CEEB",
	["SlateBlue"]="#6A5ACD",
	["SlateGray"]="#708090",
	["Snow"]="#FFFAFA",
	["SpringGreen"]="#00FF7F",
	["SteelBlue"]="#4682B4",
	["Tan"]="#D2B48C",
	["Teal"]="#008080",
	["Thistle"]="#D8BFD8",
	["Tomato"]="#FF6347",
	["Turquoise"]="#40E0D0",
	["Violet"]="#EE82EE",
	["VioletRed"]="#D02090",
	["Wheat"]="#F5DEB3",
	["White"]="#FFFFFF",
	["WhiteSmoke"]="#F5F5F5",
	["Yellow"]="#FFFF00",
	["YellowGreen"]="#9ACD32"
}

function StyleColor.ProcessPresetColors()
	local temp = {};
	for name, value in pairs(presetColors) do
		temp[string.lower(name)] = value;
	end
	presetColors = temp;
end

local function convertRGBTo16(color)
	local temp_color;
	local r,g,b,a = string.match(color,"(%d+),(%d+),(%d+),(%d+[.]?%d*)");
	if(not (r and g and b and a)) then
		r,g,b = string.match(color,"(%d+),(%d+),(%d+)");
	end

	if(r and g and b) then
		a = math.floor((a or 1.0)*255 + 0.5);
		temp_color = string.format("#%02x%02x%02x%02x",r,g,b,a);
	end
	return temp_color;
end

local function convertHSLTo16(color)
	local temp_color;
	local h,s,l,a = string.match(color,"(%d+),(%d+)%%,(%d+)%%,(%d+[.]?%d*)");
	if(not (h and s and l and a)) then
		h,s,l = string.match(color,"(%d+),(%d+)%%,(%d+)%%");
	end

	if(h and s and l) then
		h,s,l = h%360,s/100,l/100;
		--echo({h,s,l});
		local r,g,b = Color.hsl2rgb(h,s,l);
		--echo({r,g,b})
		a = math.floor((a or 1.0)*255 + 0.5);
		temp_color = string.format("#%02x%02x%02x%02x",r,g,b,a);
	end
	return temp_color;
end

function StyleColor.ConvertTo16(color)
	color = string.lower(color);
	local temp_color;
	if(string.match(color,"^#%x%x%x%x%x%x") or string.match(color,"^#%x%x%x%x%x%x%x%x")) then
		-- do nothing
		temp_color = color;
	elseif(string.match(color,"^#%x%x%x")) then
		temp_color = string.gsub(color,"%x","%1%1");
	elseif(string.match(color,"^rgb.+")) then
		temp_color = convertRGBTo16(color);
	elseif(string.match(color,"^hsl.+")) then
		temp_color = convertHSLTo16(color);
	else
		temp_color = presetColors[color];
	end
	if(not temp_color) then
		LOG.std(nil, "warn", "StyleColor.ConvertTo16", "\"%s\" is invalid css color format!", color);
	end
	return temp_color or "#ffffffff";
end