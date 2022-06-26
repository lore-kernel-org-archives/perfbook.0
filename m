Return-Path: <SRS0=+MLy=XB=illinois.edu=snir@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=illinois.edu; h=from : to : cc :
 subject : date : message-id : references : in-reply-to : content-type :
 mime-version; s=campusrelays;
 bh=IAlOGLs3BvNFY2DQmIAIJt3rj7Sudu4YjPjiUpThKGs=;
 b=dXyZOI+DjaNjfARZPy2xUoiNPJ3iEgSi3hRCYS+9R5HgySMsAyGDfMw8mxW3gxGanaWF
 6Fc0pTWs03BlEdoHTPvMKa3tj4MDZFvXcDZZZlvpDDsKwL+ozKi0MeNS7xy20hYQ3ToA
 njpkNva6QNMh+KBx3uqqwXpqfGKBS/fpQEELPn0jod3ph5NAsgzfeiP57kADT4W/LPqQ
 ZIkjhj9rEgdfDKF71vzAwvK/+KsfCoxx+sRmbvQeAx049f9I4ERTkyJpa8+ivIdhxZ76
 wkNWav3H/Gt+v+stUQ9T4SWr68XrAzi7m0LgphbGCmY/2ZHHvwuSldRTSkRMvBB21h6a bQ== 
From: "Snir, Marc" <snir@illinois.edu>
Subject: Re: Is parallel programing hard...
Date: Sun, 26 Jun 2022 18:52:26 +0000
Message-ID: <4004322A-4FF7-435F-8427-A01621C106B1@illinois.edu>
References: <32CE6D0C-1D26-423E-8A7F-AAC47B085DFF@illinois.edu>
 <20220626030351.GI1790663@paulmck-ThinkPad-P17-Gen-1>
 <efc0a14f-2265-39b7-8d57-b2a6a35e0b46@gmail.com>
In-Reply-To: <efc0a14f-2265-39b7-8d57-b2a6a35e0b46@gmail.com>
Content-Language: en-US
Content-Type: multipart/alternative;
	boundary="_000_4004322A4FF7435F8427A01621C106B1illinoisedu_"
MIME-Version: 1.0
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "perfbook@vger.kernel.org" <perfbook@vger.kernel.org>, "Paul E. McKenney" <paulmck@kernel.org>
List-ID: <perfbook.vger.kernel.org>

--_000_4004322A4FF7435F8427A01621C106B1illinoisedu_
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

lm is installed

On Jun 25, 2022, at 11:12 PM, Akira Yokosawa <akiyks@gmail.com<mailto:akiyk=
s@gmail.com>> wrote:

On Sat, 25 Jun 2022 20:03:51 -0700, Paul E. McKenney wrote:
[ Adding the perfbook email list on CC. ]


On Sun, Jun 26, 2022 at 02:00:40AM +0000, Snir, Marc wrote:
Hi:
I got a fatal latex error trying to create the pdf on my own. I append
below the last lines of the log and the full log. Latex seems to fail
soon after \maketitle

This is a new one on me!

One workaround is to us int Dockerfile template under the docker/
subdirectory. This is described in question 13 in FAQ-BUILD.txt
in the top-level directory.

What environment are you running in? There are quirks for a few
of them.

I send this FYI, in case it might help you; I loaded the pdf file,
and this works for me.

Glad the PDF file worked!

Which reminds me, it is past time for me to do another release.

Thanks for putting all this material on the web.

Glad you like it, and I hope that it proves helpful!

Thanx, Paul

Marc

Hi Marc,

I see in your log, you are using vanilla TeX Live 2022.

I'm regularly building with vanilla TeX Live, and have not seen
such an error.






(/usr/local/texlive/2022/texmf-dist/tex/latex/newtx/ts1ntxtlf.fd
File: ts1ntxtlf.fd 2015/01/18 v1.0 fd file for TS1/ntxtlf
)
LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be
(Font) scaled to size 12.0pt on input line 605.
LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be
(Font) scaled to size 8.8pt on input line 605.
LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be
(Font) scaled to size 6.6pt on input line 605.


! LaTeX Error: There's no line here to end.

In my build, messages in the log around here proceeds as follows:

(/usr/local/texlive/2022/texmf-dist/tex/latex/newtx/ts1ntxtlf.fd
File: ts1ntxtlf.fd 2015/01/18 v1.0 fd file for TS1/ntxtlf
)
LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be
(Font) scaled to size 12.0pt on input line 607.
LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be
(Font) scaled to size 8.8pt on input line 607.
LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be
(Font) scaled to size 6.6pt on input line 607.
LaTeX Font Info: Trying to load font information for T1+lmtt on input line =
6
07.

(/usr/local/texlive/2022/texmf-dist/tex/latex/lm/t1lmtt.fd
File: t1lmtt.fd 2015/05/01 v1.6.1 Font defs for Latin Modern
)

I think "Latin Modern" font is one of essential font packages on TeX Live
these days, but do you have the "lm" font package installed on your system?

Thanks, Akira



See the LaTeX manual or LaTeX Companion for explanation.
Type H <return> for immediate help.
...

l.605 \IfTwoColumn
{
?
! Emergency stop.
...

l.605 \IfTwoColumn
{
Your command was ignored.
Type I <command> <return> to replace it with another command,
or <return> to continue without it.


--_000_4004322A4FF7435F8427A01621C106B1illinoisedu_
Content-Type: text/html; charset="us-ascii"
Content-ID: <F76032FEAAAEC24EAE3FFF4C1BBD8F89@namprd11.prod.outlook.com>
Content-Transfer-Encoding: quoted-printable

<html>
<head>
<meta http-equiv=3D"Content-Type" content=3D"text/html; charset=3Dus-ascii"=
>
</head>
<body style=3D"word-wrap: break-word; -webkit-nbsp-mode: space; line-break:=
 after-white-space;" class=3D"">
lm is installed<br class=3D"">
<div><br class=3D"">
<blockquote type=3D"cite" class=3D"">
<div class=3D"">On Jun 25, 2022, at 11:12 PM, Akira Yokosawa &lt;<a href=3D=
"mailto:akiyks@gmail.com" class=3D"">akiyks@gmail.com</a>&gt; wrote:</div>
<br class=3D"Apple-interchange-newline">
<div class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helv=
etica; font-size: 20px; font-style: normal; font-variant-caps: normal; font=
-weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-=
stroke-width: 0px; text-decoration: none; float: none; display: inline !imp=
ortant;" class=3D"">On
 Sat, 25 Jun 2022 20:03:51 -0700, Paul E. McKenney wrote:</span><br style=
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
[ Adding the perfbook email list on CC. ]<br class=3D"">
<br class=3D"">
</blockquote>
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
On Sun, Jun 26, 2022 at 02:00:40AM +0000, Snir, Marc wrote:<br class=3D"">
<blockquote type=3D"cite" class=3D"">Hi:<br class=3D"">
I got a fatal latex error trying to create the pdf on my own. I append<br c=
lass=3D"">
below the last lines of the log and the full log. Latex seems to fail<br cl=
ass=3D"">
soon after \maketitle<br class=3D"">
</blockquote>
<br class=3D"">
This is a new one on me!<br class=3D"">
<br class=3D"">
One workaround is to us int Dockerfile template under the docker/<br class=
=3D"">
subdirectory. This is described in question 13 in FAQ-BUILD.txt<br class=3D=
"">
in the top-level directory.<br class=3D"">
<br class=3D"">
What environment are you running in? There are quirks for a few<br class=3D=
"">
of them.<br class=3D"">
<br class=3D"">
<blockquote type=3D"cite" class=3D"">I send this FYI, in case it might help=
 you; I loaded the pdf file,<br class=3D"">
and this works for me.<br class=3D"">
</blockquote>
<br class=3D"">
Glad the PDF file worked!<br class=3D"">
<br class=3D"">
Which reminds me, it is past time for me to do another release.<br class=3D=
"">
<br class=3D"">
<blockquote type=3D"cite" class=3D"">Thanks for putting all this material o=
n the web.<br class=3D"">
</blockquote>
<br class=3D"">
Glad you like it, and I hope that it proves helpful!<br class=3D"">
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
<blockquote type=3D"cite" class=3D"">Marc<br class=3D"">
</blockquote>
</blockquote>
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
=3D"">Hi
 Marc,</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica=
; font-size: 20px; font-style: normal; font-variant-caps: normal; font-weig=
ht: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-=
transform: none; white-space: normal; word-spacing: 0px; -webkit-text-strok=
e-width: 0px; text-decoration: none;" class=3D"">
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
=3D"">I
 see in your log, you are using vanilla TeX Live 2022.</span><br style=3D"c=
aret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 20px; font-sty=
le: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: no=
rmal; text-align: start; text-indent: 0px; text-transform: none; white-spac=
e: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorati=
on: none;" class=3D"">
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
=3D"">I'm
 regularly building with vanilla TeX Live, and have not seen</span><br styl=
e=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 20px; fo=
nt-style: normal; font-variant-caps: normal; font-weight: 400; letter-spaci=
ng: normal; text-align: start; text-indent: 0px; text-transform: none; whit=
e-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-de=
coration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 20px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">such
 an error.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helve=
tica; font-size: 20px; font-style: normal; font-variant-caps: normal; font-=
weight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; t=
ext-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-s=
troke-width: 0px; text-decoration: none;" class=3D"">
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
<br class=3D"">
<br class=3D"">
<br class=3D"">
<br class=3D"">
(/usr/local/texlive/2022/texmf-dist/tex/latex/newtx/ts1ntxtlf.fd<br class=
=3D"">
File: ts1ntxtlf.fd 2015/01/18 v1.0 fd file for TS1/ntxtlf<br class=3D"">
)<br class=3D"">
LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be<br class=3D"">
(Font) scaled to size 12.0pt on input line 605.<br class=3D"">
LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be<br class=3D"">
(Font) scaled to size 8.8pt on input line 605.<br class=3D"">
LaTeX Font Info: Font shape `TS1/ntxtlf/m/n' will be<br class=3D"">
(Font) scaled to size 6.6pt on input line 605.<br class=3D"">
<br class=3D"">
<br class=3D"">
! LaTeX Error: There's no line here to end.<br class=3D"">
</blockquote>
</blockquote>
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
=3D"">In
 my build, messages in the log around here proceeds as follows:</span><br s=
tyle=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 20px;=
 font-style: normal; font-variant-caps: normal; font-weight: 400; letter-sp=
acing: normal; text-align: start; text-indent: 0px; text-transform: none; w=
hite-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text=
-decoration: none;" class=3D"">
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
=3D"">(/usr/local/texlive/2022/texmf-dist/tex/latex/newtx/ts1ntxtlf.fd</spa=
n><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 20px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 20px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">File:
 ts1ntxtlf.fd 2015/01/18 v1.0 fd file for TS1/ntxtlf</span><br style=3D"car=
et-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 20px; font-style=
: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: norm=
al; text-align: start; text-indent: 0px; text-transform: none; white-space:=
 normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration=
: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 20px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">)</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetic=
a; font-size: 20px; font-style: normal; font-variant-caps: normal; font-wei=
ght: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text=
-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stro=
ke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 20px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">LaTeX
 Font Info: Font shape `TS1/ntxtlf/m/n' will be</span><br style=3D"caret-co=
lor: rgb(0, 0, 0); font-family: Helvetica; font-size: 20px; font-style: nor=
mal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: norm=
al; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: non=
e;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 20px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">(Font)
 scaled to size 12.0pt on input line 607.</span><br style=3D"caret-color: r=
gb(0, 0, 0); font-family: Helvetica; font-size: 20px; font-style: normal; f=
ont-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-al=
ign: start; text-indent: 0px; text-transform: none; white-space: normal; wo=
rd-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" cl=
ass=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 20px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">LaTeX
 Font Info: Font shape `TS1/ntxtlf/m/n' will be</span><br style=3D"caret-co=
lor: rgb(0, 0, 0); font-family: Helvetica; font-size: 20px; font-style: nor=
mal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: norm=
al; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: non=
e;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 20px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">(Font)
 scaled to size 8.8pt on input line 607.</span><br style=3D"caret-color: rg=
b(0, 0, 0); font-family: Helvetica; font-size: 20px; font-style: normal; fo=
nt-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-ali=
gn: start; text-indent: 0px; text-transform: none; white-space: normal; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" cla=
ss=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 20px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">LaTeX
 Font Info: Font shape `TS1/ntxtlf/m/n' will be</span><br style=3D"caret-co=
lor: rgb(0, 0, 0); font-family: Helvetica; font-size: 20px; font-style: nor=
mal; font-variant-caps: normal; font-weight: 400; letter-spacing: normal; t=
ext-align: start; text-indent: 0px; text-transform: none; white-space: norm=
al; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: non=
e;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 20px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">(Font)
 scaled to size 6.6pt on input line 607.</span><br style=3D"caret-color: rg=
b(0, 0, 0); font-family: Helvetica; font-size: 20px; font-style: normal; fo=
nt-variant-caps: normal; font-weight: 400; letter-spacing: normal; text-ali=
gn: start; text-indent: 0px; text-transform: none; white-space: normal; wor=
d-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: none;" cla=
ss=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 20px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">LaTeX
 Font Info: Trying to load font information for T1+lmtt on input line 6</sp=
an><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-siz=
e: 20px; font-style: normal; font-variant-caps: normal; font-weight: 400; l=
etter-spacing: normal; text-align: start; text-indent: 0px; text-transform:=
 none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0=
px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 20px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">07.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvet=
ica; font-size: 20px; font-style: normal; font-variant-caps: normal; font-w=
eight: 400; letter-spacing: normal; text-align: start; text-indent: 0px; te=
xt-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-st=
roke-width: 0px; text-decoration: none;" class=3D"">
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
=3D"">(/usr/local/texlive/2022/texmf-dist/tex/latex/lm/t1lmtt.fd</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 20px=
; font-style: normal; font-variant-caps: normal; font-weight: 400; letter-s=
pacing: normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; tex=
t-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 20px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">File:
 t1lmtt.fd 2015/05/01 v1.6.1 Font defs for Latin Modern</span><br style=3D"=
caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: 20px; font-st=
yle: normal; font-variant-caps: normal; font-weight: 400; letter-spacing: n=
ormal; text-align: start; text-indent: 0px; text-transform: none; white-spa=
ce: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decorat=
ion: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 20px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">)</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetic=
a; font-size: 20px; font-style: normal; font-variant-caps: normal; font-wei=
ght: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text=
-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stro=
ke-width: 0px; text-decoration: none;" class=3D"">
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
=3D"">I
 think &quot;Latin Modern&quot; font is one of essential font packages on T=
eX Live</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetic=
a; font-size: 20px; font-style: normal; font-variant-caps: normal; font-wei=
ght: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text=
-transform: none; white-space: normal; word-spacing: 0px; -webkit-text-stro=
ke-width: 0px; text-decoration: none;" class=3D"">
<span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size=
: 20px; font-style: normal; font-variant-caps: normal; font-weight: 400; le=
tter-spacing: normal; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0p=
x; text-decoration: none; float: none; display: inline !important;" class=
=3D"">these
 days, but do you have the &quot;lm&quot; font package installed on your sy=
stem?</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica;=
 font-size: 20px; font-style: normal; font-variant-caps: normal; font-weigh=
t: 400; letter-spacing: normal; text-align: start; text-indent: 0px; text-t=
ransform: none; white-space: normal; word-spacing: 0px; -webkit-text-stroke=
-width: 0px; text-decoration: none;" class=3D"">
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
<br class=3D"">
See the LaTeX manual or LaTeX Companion for explanation.<br class=3D"">
Type H &lt;return&gt; for immediate help.<br class=3D"">
...<br class=3D"">
<br class=3D"">
l.605 \IfTwoColumn<br class=3D"">
{<br class=3D"">
?<br class=3D"">
! Emergency stop.<br class=3D"">
...<br class=3D"">
<br class=3D"">
l.605 \IfTwoColumn<br class=3D"">
{<br class=3D"">
Your command was ignored.<br class=3D"">
Type I &lt;command&gt; &lt;return&gt; to replace it with another command,<b=
r class=3D"">
or &lt;return&gt; to continue without it.</blockquote>
</blockquote>
</div>
</blockquote>
</div>
<br class=3D"">
</body>
</html>

--_000_4004322A4FF7435F8427A01621C106B1illinoisedu_--
