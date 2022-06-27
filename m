Return-Path: <SRS0=vfFV=XC=illinois.edu=snir@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=illinois.edu; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=campusrelays;
 bh=vo9NQKzNZ5wyVLqJaUfPEAqfkdqNgIevdrYUQjXwOgo=;
 b=n15NKHlaAanaiUxvVc8nOCTxy2ut99obksxKNb69bt0LSCfkUx4Uwz7EPDGEGcZldKD1
 iX22O21ediQ5uZVoaEH2S8+DoEUxmeoGIGWN+fE2aFC90RxP0Ol+btV7Og8O08Ax+pI8
 kyfKVz37WHo+Vd0r1Yh/hXahqQC04n9DvAHhR6tHglgG4dANSWeozzMWBWK6hXXS5lti
 RB2pUWM4eoQNVzEjy+IOROs3FN2DKdMzgjS3g50bi9/ZuU/R09cCkzYYsrfBnhJCVDSY
 4zIu6jhbTDo++7k/Am9LsY4BUoaGwfUwD/CwDF0my48W0wYUNJ7bXsm9dEypbKP/3UKW wQ== 
From: "Snir, Marc" <snir@illinois.edu>
Subject: Re: Is parallel programing hard...
Date: Mon, 27 Jun 2022 15:36:20 +0000
Message-ID: <40DCB8FE-A5C4-47F9-8215-EC0432803FF1@illinois.edu>
References: <32CE6D0C-1D26-423E-8A7F-AAC47B085DFF@illinois.edu>
 <20220626030351.GI1790663@paulmck-ThinkPad-P17-Gen-1>
 <efc0a14f-2265-39b7-8d57-b2a6a35e0b46@gmail.com>
 <4004322A-4FF7-435F-8427-A01621C106B1@illinois.edu>
 <0b12a2ee-5edd-d169-2b8c-1a403df7e34c@gmail.com>
 <20220627141106.GD1790663@paulmck-ThinkPad-P17-Gen-1>
 <fb3a89ba-48ec-1943-4f6f-84123b751b37@gmail.com>
 <20220627145628.GE1790663@paulmck-ThinkPad-P17-Gen-1>
 <c341ba87-ba38-11ba-c770-e341c5164b42@gmail.com>
In-Reply-To: <c341ba87-ba38-11ba-c770-e341c5164b42@gmail.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_40DCB8FEA5C447F98215EC0432803FF1illinoisedu_"
MIME-Version: 1.0
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@kernel.org>, "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>
List-ID: <perfbook.vger.kernel.org>

--_000_40DCB8FEA5C447F98215EC0432803FF1illinoisedu_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

I used MacTex to install Latex and mostly used Brew to install Linux tools

On Jun 27, 2022, at 10:19 AM, Akira Yokosawa <akiyks@gmail.com<mailto:akiyk=
s@gmail.com>> wrote:

On Mon, 27 Jun 2022 07:56:28 -0700, Paul E. McKenney wrote:
On Mon, Jun 27, 2022 at 11:52:18PM +0900, Akira Yokosawa wrote:
On Mon, 27 Jun 2022 07:11:06 -0700, Paul E. McKenney wrote:
On Mon, Jun 27, 2022 at 07:32:29PM +0900, Akira Yokosawa wrote:
[...]

For the record:

It turns out that Marc attempted the build under macOS 12.4, which
resulted in a corrupted autodate.tex.
It means utilities/autodate.sh doesn't work as expected under macOS.

The cause might be the difference of primitive tools such as "date",
"sed", and "grep". We assume those from GNU, while macOS has those
of BSD origin.

As I don't have a macOS system at my disposal, I can't help further.

(I was surprised to know that the build scripts worked without a fatal
error until the first run of pdflatex.)

In theory, it is possible to use the "findutils" and "brew" commands to
set up gnu utilities on MacOS, and to do so such that your PATH variable
can be used to choose whether the default is the MacOS versions or the
gnu versions. Or so it says here:

https://urldefense.com/v3/__https://www.google.com/search?q=3Dlatex*on*maco=
s&oq=3Dlatex*on*macos&aqs=3Dchrome..69i57j0i22i30l9.3869j1j7&client=3Dubunt=
u&sourceid=3Dchrome&ie=3DUTF-8__;KysrKw!!DZ3fjg!4_j5YLKDbzfq9B7h6-F8zxtMnks=
VmYkZGrTI8UNScPy0Hqxl4_ieTdmHu_WSoG9aMUBWzuwNnob4gw$

I do have an old MacOS system, but it is at home and I am on travel.

How old is it? :-)

About three years, but running a current MacOS.

I would need to install LaTeX on it (last time I tried, the installation
hung), but Marc proved that it is possible to actually install it. ;-) If
I can pass that hurdle, I will try making perfbook use the gnu utilities.

Or is this where someone tells me that LaTeX on MacOS make use of
scripts that rely on the MacOS variants of these commands? ;-)

I don't think so.
If you can make scripts under utilities/ behave as expected,
"make" should work.

Except:

Some of perl scripts have shebang lines of:

#!/usr/bin/perl

, and are invoked directly from recipes in Makefile.
You need to change them to:

#!/usr/bin/env perl

, so that your PATH setting is respected. You might need similar
tweaks for scripts of other languages.
I was confused. perl is perl. There is no GNU or BSD flavor...

Thanks, Akira


Good luck!

I will need it. ;-)

Thanx, Paul

Thanks, Akira


Thoughts?

Thanx, Paul

[...]


--_000_40DCB8FEA5C447F98215EC0432803FF1illinoisedu_
Content-Type: text/html; charset="us-ascii"
Content-ID: <E680AE311D782C4AB4F426AAE19689FF@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
I used MacTex to install Latex and mostly used Brew to install Linux tools<=
br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On Jun 27, 2022, at 10:19 AM, Akira Yokosawa &lt;<a href=3D=
"mailto:akiyks@gmail.com" class=3D"">akiyks@gmail.com</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 20px; font-style: normal; font-variant-caps: normal; font=
-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; text-decoration: none; float: none; display: inline !imp=
ortant;" class=3D"">On
 Mon, 27 Jun 2022 07:56:28 -0700, Paul E. McKenney wrote:</span><br style=
=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 20px; fon=
t-style: normal; font-variant-caps: normal; font-weight: 400; letter-spacin=
g: normal; text-align: start; text-indent: 0px; text-transform: none; white=
-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-dec=
oration: none;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 20px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; orphans: auto; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit=
-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: n=
one;" class=3D"">
On Mon, Jun 27, 2022 at 11:52:18PM +0900, Akira Yokosawa wrote:<br class=3D=
"">
<blockquote type=3D"cite" class=3D"">On Mon, 27 Jun 2022 07:11:06 -0700, Pa=
ul E. McKenney wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"">On Mon, Jun 27, 2022 at 07:32:29PM +09=
00, Akira Yokosawa wrote:<br class=3D"">
</blockquote>
[...]<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<blockquote type=3D"cite" class=3D""><br class=3D"">
For the record:<br class=3D"">
<br class=3D"">
It turns out that Marc attempted the build under macOS 12.4, which<br class=
=3D"">
resulted in a corrupted autodate.tex.<br class=3D"">
It means utilities/autodate.sh doesn't work as expected under macOS.<br cla=
ss=3D"">
<br class=3D"">
The cause might be the difference of primitive tools such as &quot;date&quo=
t;,<br class=3D"">
&quot;sed&quot;, and &quot;grep&quot;. We assume those from GNU, while macO=
S has those<br class=3D"">
of BSD origin.<br class=3D"">
<br class=3D"">
As I don't have a macOS system at my disposal, I can't help further.<br cla=
ss=3D"">
<br class=3D"">
(I was surprised to know that the build scripts worked without a fatal<br c=
lass=3D"">
error until the first run of pdflatex.)<br class=3D"">
</blockquote>
<br class=3D"">
In theory, it is possible to use the &quot;findutils&quot; and &quot;brew&q=
uot; commands to<br class=3D"">
set up gnu utilities on MacOS, and to do so such that your PATH variable<br=
 class=3D"">
can be used to choose whether the default is the MacOS versions or the<br c=
lass=3D"">
gnu versions. Or so it says here:<br class=3D"">
<br class=3D"">
<a href=3D"https://urldefense.com/v3/__https://www.google.com/search?q=3Dla=
tex*on*macos&amp;oq=3Dlatex*on*macos&amp;aqs=3Dchrome..69i57j0i22i30l9.3869=
j1j7&amp;client=3Dubuntu&amp;sourceid=3Dchrome&amp;ie=3DUTF-8__;KysrKw!!DZ3=
fjg!4_j5YLKDbzfq9B7h6-F8zxtMnksVmYkZGrTI8UNScPy0Hqxl4_ieTdmHu_WSoG9aMUBWzuw=
Nnob4gw$" class=3D"">https://urldefense.com/v3/__https://www.google.com/sea=
rch?q=3Dlatex*on*macos&amp;oq=3Dlatex*on*macos&amp;aqs=3Dchrome..69i57j0i22=
i30l9.3869j1j7&amp;client=3Dubuntu&amp;sourceid=3Dchrome&amp;ie=3DUTF-8__;K=
ysrKw!!DZ3fjg!4_j5YLKDbzfq9B7h6-F8zxtMnksVmYkZGrTI8UNScPy0Hqxl4_ieTdmHu_WSo=
G9aMUBWzuwNnob4gw$</a><span class=3D"Apple-converted-space">&nbsp;</span><b=
r class=3D"">
<br class=3D"">
I do have an old MacOS system, but it is at home and I am on travel.<br cla=
ss=3D"">
</blockquote>
<br class=3D"">
How old is it? :-)<br class=3D"">
</blockquote>
<br class=3D"">
About three years, but running a current MacOS.<br class=3D"">
<br class=3D"">
<blockquote type=3D"cite" class=3D"">
<blockquote type=3D"cite" class=3D"">I would need to install LaTeX on it (l=
ast time I tried, the installation<br class=3D"">
hung), but Marc proved that it is possible to actually install it. ;-) If<b=
r class=3D"">
I can pass that hurdle, I will try making perfbook use the gnu utilities.<b=
r class=3D"">
<br class=3D"">
Or is this where someone tells me that LaTeX on MacOS make use of<br class=
=3D"">
scripts that rely on the MacOS variants of these commands? ;-)<br class=3D"=
">
</blockquote>
<br class=3D"">
I don't think so.<br class=3D"">
If you can make scripts under utilities/ behave as expected,<br class=3D"">
&quot;make&quot; should work.<br class=3D"">
<br class=3D"">
Except:<br class=3D"">
<br class=3D"">
Some of perl scripts have shebang lines of:<br class=3D"">
<br class=3D"">
#!/usr/bin/perl<br class=3D"">
<br class=3D"">
, and are invoked directly from recipes in Makefile.<br class=3D"">
You need to change them to:<br class=3D"">
<br class=3D"">
#!/usr/bin/env perl<br class=3D"">
<br class=3D"">
, so that your PATH setting is respected. You might need similar<br class=
=3D"">
tweaks for scripts of other languages.<br class=3D"">
</blockquote>
</blockquote>
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 20px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">I
 was confused. perl is perl. There is no GNU or BSD flavor...</span><br sty=
le=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 20px; f=
ont-style: normal; font-variant-caps: normal; font-weight: 400; letter-spac=
ing: normal; text-align: start; text-indent: 0px; text-transform: none; whi=
te-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-d=
ecoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
20px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 20px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">Thanks,
 Akira</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica=
; font-size: 20px; font-style: normal; font-variant-caps: normal; font-weig=
ht: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; word-spacing: 0px; -webkit-text-strok=
e-width: 0px; text-decoration: none;" class=3D"">
<br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
20px; font-style: normal; font-variant-caps: normal; font-weight: 400; lett=
er-spacing: normal; text-align: start; text-indent: 0px; text-transform: no=
ne; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px;=
 text-decoration: none;" class=3D"">
<blockquote type=3D"cite" style=3D"font-family: Helvetica; font-size: 20px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; orphans: auto; text-align: start; text-indent: 0px; text-tra=
nsform: none; white-space: normal; widows: auto; word-spacing: 0px; -webkit=
-text-size-adjust: auto; -webkit-text-stroke-width: 0px; text-decoration: n=
one;" class=3D"">
<blockquote type=3D"cite" class=3D""><br class=3D"">
Good luck!<br class=3D"">
</blockquote>
<br class=3D"">
I will need it. ;-)<br class=3D"">
<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space: pre;"></span><span cla=
ss=3D"Apple-tab-span" style=3D"white-space: pre;"></span><span class=3D"App=
le-tab-span" style=3D"white-space: pre;"></span><span class=3D"Apple-tab-sp=
an" style=3D"white-space: pre;"></span><span class=3D"Apple-tab-span" style=
=3D"white-space: pre;"></span><span class=3D"Apple-tab-span" style=3D"white=
-space: pre;"></span><span class=3D"Apple-tab-span" style=3D"white-space: p=
re;"></span>Thanx,
 Paul<br class=3D"">
<br class=3D"">
<blockquote type=3D"cite" class=3D"">Thanks, Akira<br class=3D"">
<br class=3D"">
<blockquote type=3D"cite" class=3D""><br class=3D"">
Thoughts?<br class=3D"">
<br class=3D"">
<span class=3D"Apple-tab-span" style=3D"white-space: pre;"></span><span cla=
ss=3D"Apple-tab-span" style=3D"white-space: pre;"></span><span class=3D"App=
le-tab-span" style=3D"white-space: pre;"></span><span class=3D"Apple-tab-sp=
an" style=3D"white-space: pre;"></span><span class=3D"Apple-tab-span" style=
=3D"white-space: pre;"></span><span class=3D"Apple-tab-span" style=3D"white=
-space: pre;"></span><span class=3D"Apple-tab-span" style=3D"white-space: p=
re;"></span>Thanx,
 Paul<br class=3D"">
<br class=3D"">
</blockquote>
[...]</blockquote>
</blockquote>
</div>
</blockquote>
</div>
<br class=3D"">
</body>
</html>

--_000_40DCB8FEA5C447F98215EC0432803FF1illinoisedu_--
