a=AudioDub(ffaudiosource("c:\Users\tom\Documents\graphics\video\toConvert\tmp\191226_2137_01.MOV"),ffvideosource("c:\Users\tom\Documents\graphics\video\toConvert\tmp\191226_2137_01.MOV")).BilinearResize(640,360).turn180

b=AudioDub(ffaudiosource("c:\Users\tom\Documents\graphics\video\toConvert\tmp\191226_2148_01.mkv"),ffvideosource("c:\Users\tom\Documents\graphics\video\toConvert\tmp\191226_2148_01.mkv")).BilinearResize(640,360).turn180

c=AudioDub(ffaudiosource("c:\Users\tom\Documents\graphics\video\toConvert\tmp\191226_2152_01.mkv"),ffvideosource("c:\Users\tom\Documents\graphics\video\toConvert\tmp\191226_2152_01.mkv")).BilinearResize(640,360).turn180

d=AudioDub(ffaudiosource("c:\Users\tom\Documents\graphics\video\toConvert\tmp\191226_2203_01.mkv"),ffvideosource("c:\Users\tom\Documents\graphics\video\toConvert\tmp\191226_2203_01.mkv")).BilinearResize(640,360).turn180

e=AudioDub(ffaudiosource("c:\Users\tom\Documents\graphics\video\toConvert\tmp\191226_2215_01.mkv"),ffvideosource("c:\Users\tom\Documents\graphics\video\toConvert\tmp\191226_2215_01.mkv")).BilinearResize(640,360).turn180

f=AudioDub(ffaudiosource("c:\Users\tom\Documents\graphics\video\toConvert\tmp\191226_2217_01.mkv"),ffvideosource("c:\Users\tom\Documents\graphics\video\toConvert\tmp\191226_2217_01.mkv")).BilinearResize(640,360).turn180

g=AudioDub(ffaudiosource("c:\Users\tom\Documents\graphics\video\toConvert\tmp\191226_2219_01.mkv"),ffvideosource("c:\Users\tom\Documents\graphics\video\toConvert\tmp\191226_2219_01.mkv")).BilinearResize(640,360).turn180

h=AudioDub(ffaudiosource("c:\Users\tom\Documents\graphics\video\toConvert\tmp\191226_2220_01.mkv"),ffvideosource("c:\Users\tom\Documents\graphics\video\toConvert\tmp\191226_2220_01.mkv")).BilinearResize(640,360).turn180


#(a.changeFPS(10).assumeFPS(20) \
#++b.assumeFPS(20) \
#++c.assumeFPS(20) \
#++d.assumeFPS(20) \
#++e.assumeFPS(20) \
#++f.assumeFPS(20) \
#++g.assumeFPS(20) \
#++h.assumeFPS(20) \
#).changeFPS(3).assumeFPS(20)

a.changeFPS(2,linear=false).assumeFPS(20) \
++b.changeFPS(1,linear=false).assumeFPS(20) \
++c.changeFPS(1,linear=false).assumeFPS(20) \
++d.changeFPS(1,linear=false).assumeFPS(20) \
++e.changeFPS(1,linear=false).assumeFPS(20) \
++f.changeFPS(1,linear=false).assumeFPS(20) \
++g.changeFPS(1,linear=false).assumeFPS(20) \
++h.changeFPS(1,linear=false).assumeFPS(20)

# save original
orig = last
#orig=last.converttorgb32

#orig
last
#__END__
blur=last.blur(1).blur(1).blur(1).blur(1).blur(1).blur(1).blur(1).blur(1).blur(1).blur(1).blur(1).blur(1).blur(1)


# THE MASK
# flatten contrast
hdragc(coef_gain=0.8,coef_sat=0.6)
contrastmask(gblur=20,enhance=5)
ColorYUV(gamma_y=0, off_y=12, cont_y=24)
flattened = last

blur(1).blur(1).blur(1).blur(1).blur(1).blur(1).blur(1).blur(1)
#converttorgb32
converttoYV12
mt_lut("x 128 - abs 16 * 32 - ", chroma="-128")
mt_inpand
#mt_binarize
blur(1).blur(1).blur(1).blur(1).blur(1).blur(1).blur(1).greyscale

#mt_expand.mt_binarize.blur(1).blur(1).blur(1).blur(1).blur(1)

mask = last
mask 

orig.converttoYV12.overlay(blur,mask=mask,mode="darken",opacity=0.9)

logo = ImageSource("c:\Users\tom\Documents\graphics\video\toConvert\overlays\640x360_voerlay.png", fps=24, end = 700, use_DevIL=true,pixel_type="rgb32").fadeIO(60)
overlay(logo,mask=logo.showAlpha,mode="blend",opacity=0.5)

audio = DirectShowSource("c:\Users\tom\Documents\misc\audio\personal\2019\contrails-in-the-sky\contrails-in-the-sky_mix.wav").normalize()

AudioDub(last,audio) 
#last.Fade_stu(969, 989, vfade=false)


__END__

mt_edge.blur(1).blur(1).blur(1).blur(1).blur(1).blur(1).blur(1)
last
#mask = blur(1).blur(1).blur(1).blur(1).blur(1).blur(1)
#mask = mask.levels(103,1.409,255,0,255)
#mt_merge(orig.converttoYV12, last,mask, Y=3, U=2, V=2)


#orig.Subtract(last).converttoYV12 #.blur(1).blur(1).blur(1).blur(1).blur(1)
#levels(126,1,127,1,255)
