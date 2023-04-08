Return-Path: <SRS0=0xZM=77=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680933774;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=D1SytHubWSROpWD+lpJc97A/qw58pfgjf9aW6YRQbgs=;
        b=LsdptDwe/EGD3UXO6mkO26TWe4DvA5pIEfe/jWwjh+aWo3mV1pxizS2MDL6vxiWzeG
         5PilzAoKqavkYsETOq0UfLqAwC6PJDO0i6hVzvH6h3d7rE6Q/AMDwKK2CHpUPDN2p5OD
         jKB7iIgS0eLBa1ZHyAEVx1hhiHb57tBBenP7jPDmzZLGuUASDpqwLXoWmIANvjY7kbEG
         S8ebbsRIC0gUwBNpP5JJS+IexzAjmESNg8q58WnEgez+BZErM7rwNgquIWc5T7YexpuG
         X/r092EPo6d4LMn0pACavIHKylvzcKfQnOaAQdDYX3bFQYZHNJDg2R2TuZmFwSJBpsPJ
         w1jQ==
From: Alan Huang <mmpgouride@gmail.com>
Message-Id: <326A44E6-D7D3-4A13-B9A7-B1699F1A09A4@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_8E44E03C-F7F4-4C2A-801E-FA392BAA1FBD"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] CodeSamples/count: Remove unnecessary memory barriers
Date: Sat, 8 Apr 2023 14:02:29 +0800
In-Reply-To: <71f63305-0d90-1ebf-fa91-0ec33e657904@gmail.com>
References: <20230407175813.1334028-1-mmpgouride@gmail.com>
 <71f63305-0d90-1ebf-fa91-0ec33e657904@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>


--Apple-Mail=_8E44E03C-F7F4-4C2A-801E-FA392BAA1FBD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Akira,

Thanks for pointing that out,  I have sent patch v4.

Thanks,
Alan



> 2023=E5=B9=B44=E6=9C=888=E6=97=A5 =E4=B8=8B=E5=8D=8812:25=EF=BC=8CAkira =
Yokosawa <akiyks@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Alan,
>=20
> Maybe I was not clear enough, but there are minor inconsistencies in
> PDF rendering.  Please see below.
>=20
> On Fri,  7 Apr 2023 13:58:13 -0400, Alan Huang wrote:
>> In count_lim_sig.c, there is only one ordering required, that is
>> writing to counter happens before setting theft to THEFT_READY in
>> add_count/sub_count's fast path. Therefore, partial memory barrier
>> will suffice.
>>=20
>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
>> ---
>> CodeSamples/count/count_lim_sig.c | 10 +++-------
>> count/count.tex                   | 12 ++++++------
>> 2 files changed, 9 insertions(+), 13 deletions(-)
>>=20
>> diff --git a/CodeSamples/count/count_lim_sig.c =
b/CodeSamples/count/count_lim_sig.c
>> index 59da8077..c2f61197 100644
>> --- a/CodeSamples/count/count_lim_sig.c
>> +++ b/CodeSamples/count/count_lim_sig.c
>> @@ -56,12 +56,10 @@ static void flush_local_count_sig(int unused)	=
//\lnlbl{flush_sig:b}
>> {
>> 	if (READ_ONCE(theft) !=3D THEFT_REQ)	=
//\lnlbl{flush_sig:check:REQ}
>> 		return;				=
//\lnlbl{flush_sig:return:n}
>> -	smp_mb();				//\lnlbl{flush_sig:mb:1}
>> 	WRITE_ONCE(theft, THEFT_ACK);		=
//\lnlbl{flush_sig:set:ACK}
>> 	if (!counting) {			=
//\lnlbl{flush_sig:check:fast}
>> -		WRITE_ONCE(theft, THEFT_READY);	=
//\lnlbl{flush_sig:set:READY}
>> +		smp_store_release(&theft, THEFT_READY);	=
//\lnlbl{flush_sig:set:READY}
>> 	}
>> -	smp_mb();
>> }						//\lnlbl{flush_sig:e}
>>=20
>> static void flush_local_count(void)			=
//\lnlbl{flush:b}
>> @@ -125,8 +123,7 @@ int add_count(unsigned long delta)			=
//\lnlbl{b}
>> 	WRITE_ONCE(counting, 0);			=
//\lnlbl{clearcnt}
>> 	barrier();					=
//\lnlbl{barrier:3}
>> 	if (READ_ONCE(theft) =3D=3D THEFT_ACK) {		=
//\lnlbl{check:ACK}
>> -		smp_mb();				//\lnlbl{mb}
>> -		WRITE_ONCE(theft, THEFT_READY);		//\lnlbl{READY}
>> +		smp_store_release(&theft, THEFT_READY);		=
//\lnlbl{READY}
>> 	}
>> 	if (fastpath)
>> 		return 1;				=
//\lnlbl{return:fs}
>> @@ -164,8 +161,7 @@ int sub_count(unsigned long delta)
>> 	WRITE_ONCE(counting, 0);
>> 	barrier();
>> 	if (READ_ONCE(theft) =3D=3D THEFT_ACK) {
>> -		smp_mb();
>> -		WRITE_ONCE(theft, THEFT_READY);
>> +		smp_store_release(&theft, THEFT_READY);
>> 	}
>> 	if (fastpath)
>> 		return 1;
>> diff --git a/count/count.tex b/count/count.tex
>> index 8ab67e2e..4c139d63 100644
>> --- a/count/count.tex
>> +++ b/count/count.tex
>> @@ -2425,12 +2425,11 @@ handler used in the theft process.
>> \Clnref{check:REQ,return:n} check to see if
>> the \co{theft} state is REQ, and, if not
>> returns without change.
>> -\Clnref{mb:1} executes a \IX{memory barrier} to ensure that the =
sampling
>> -of the theft variable happens before any change to that variable.
>> \Clnref{set:ACK} sets the \co{theft} state to ACK, and, if
>> \clnref{check:fast} sees that
>> this thread's fastpaths are not running, \clnref{set:READY} sets the =
\co{theft}
>> -state to READY\@.
>> +state to READY, with the release store ensuring any change to =
counter in
>                                                                 =
\co{counter}
>=20
>> +the fastpath happens before the change of theft to READY\@.
>                                             \co{theft}
>=20
>> \end{fcvref}
>>=20
>> \begin{listing}
>> @@ -2595,9 +2594,10 @@ handlers to undertake theft.
>> \Clnref{barrier:3} again disables compiler reordering, and then
>> \clnref{check:ACK}
>> checks to see if the signal handler deferred the \co{theft}
>> -state-change to READY, and, if so, \clnref{mb} executes a memory
>> -barrier to ensure that any CPU that sees \clnref{READY} setting =
state to
>> -READY also sees the effects of \clnref{add:f}.
>> +state-change to READY, and, if so, \clnref{READY} changes theft to
>                                                             \co{theft}
>=20
>> +READY with the release store ensuring that
>> +any CPU that sees the READY state also sees the effects
>> +of \clnref{add:f}.
>> If the fastpath addition at \clnref{add:f} was executed, then
>> \clnref{return:fs} returns
>> success.
>=20
> With those addressed,
>=20
> Reviewed-by: Akira Yokosawa <akiyks@gmail.com =
<mailto:akiyks@gmail.com>>
>=20
>        Thanks, Akira


--Apple-Mail=_8E44E03C-F7F4-4C2A-801E-FA392BAA1FBD
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Akira,<div class=3D""><br class=3D""></div><div class=3D"">Thanks for =
pointing that out, &nbsp;I have sent patch v4.</div><div class=3D""><br =
class=3D""><div class=3D"">
<div dir=3D"auto" style=3D"caret-color: rgb(0, 0, 0); color: rgb(0, 0, =
0); letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; word-wrap: =
break-word; -webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D""><div dir=3D"auto" style=3D"caret-color: rgb(0, 0, 0); color: =
rgb(0, 0, 0); letter-spacing: normal; text-align: start; text-indent: =
0px; text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; word-wrap: =
break-word; -webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D""><div>Thanks,</div><div>Alan</div></div></div><br =
class=3D"Apple-interchange-newline"><br =
class=3D"Apple-interchange-newline">
</div>
<div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">2023=E5=B9=B44=E6=9C=888=E6=97=A5 =E4=B8=8B=E5=8D=8812:25=EF=BC=
=8CAkira Yokosawa &lt;<a href=3D"mailto:akiyks@gmail.com" =
class=3D"">akiyks@gmail.com</a>&gt; =E5=86=99=E9=81=93=EF=BC=9A</div><br =
class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Hi Alan,</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Maybe I was not clear enough, but there are minor =
inconsistencies in</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">PDF rendering. &nbsp;Please see below.</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">On Fri, &nbsp;7 Apr 2023 =
13:58:13 -0400, Alan Huang wrote:</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">In count_lim_sig.c, there is only one =
ordering required, that is<br class=3D"">writing to counter happens =
before setting theft to THEFT_READY in<br class=3D"">add_count/sub_count's=
 fast path. Therefore, partial memory barrier<br class=3D"">will =
suffice.<br class=3D""><br class=3D"">Signed-off-by: Alan Huang &lt;<a =
href=3D"mailto:mmpgouride@gmail.com" =
class=3D"">mmpgouride@gmail.com</a>&gt;<br class=3D"">---<br =
class=3D"">CodeSamples/count/count_lim_sig.c | 10 +++-------<br =
class=3D"">count/count.tex =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&n=
bsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 12 ++++++------<br class=3D"">2 =
files changed, 9 insertions(+), 13 deletions(-)<br class=3D""><br =
class=3D"">diff --git a/CodeSamples/count/count_lim_sig.c =
b/CodeSamples/count/count_lim_sig.c<br class=3D"">index =
59da8077..c2f61197 100644<br class=3D"">--- =
a/CodeSamples/count/count_lim_sig.c<br class=3D"">+++ =
b/CodeSamples/count/count_lim_sig.c<br class=3D"">@@ -56,12 +56,10 @@ =
static void flush_local_count_sig(int unused)<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>//\lnlbl{flush_sig:b}<br class=3D"">{<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(READ_ONCE(theft) !=3D THEFT_REQ)<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{flush_sig:check:REQ}<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>return;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>//\lnlbl{flush_sig:return:n}<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>smp_mb();<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>//\lnlbl{flush_sig:mb:1}<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>WRITE_ONCE(theft, THEFT_ACK);<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{flush_sig:set:ACK}<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (!counting) {<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{flush_sig:check:fast}<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>WRITE_ONCE(theft, THEFT_READY);<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{flush_sig:set:READY}<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>smp_store_release(&amp;theft, THEFT_READY);<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>//\lnlbl{flush_sig:set:READY}<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>smp_mb();<br class=3D"">}<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{flush_sig:e}<br =
class=3D""><br class=3D"">static void flush_local_count(void)<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>//\lnlbl{flush:b}<br class=3D"">@@ -125,8 +123,7 @@ int =
add_count(unsigned long delta)<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{b}<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>WRITE_ONCE(counting, 0);<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{clearcnt}<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>barrier();<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>//\lnlbl{barrier:3}<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(READ_ONCE(theft) =3D=3D THEFT_ACK) {<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{check:ACK}<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>smp_mb();<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>//\lnlbl{mb}<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>WRITE_ONCE(theft, =
THEFT_READY);<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>//\lnlbl{READY}<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>smp_store_release(&amp;theft, =
THEFT_READY);<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>//\lnlbl{READY}<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(fastpath)<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return 1;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>//\lnlbl{return:fs}<br class=3D"">@@ -164,8 +161,7 @@ int =
sub_count(unsigned long delta)<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>WRITE_ONCE(counting, 0);<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>barrier();<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (READ_ONCE(theft) =3D=3D =
THEFT_ACK) {<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>smp_mb();<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>WRITE_ONCE(theft, THEFT_READY);<br class=3D"">+<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>smp_store_release(&amp;theft, THEFT_READY);<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>}<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (fastpath)<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return 1;<br class=3D"">diff =
--git a/count/count.tex b/count/count.tex<br class=3D"">index =
8ab67e2e..4c139d63 100644<br class=3D"">--- a/count/count.tex<br =
class=3D"">+++ b/count/count.tex<br class=3D"">@@ -2425,12 +2425,11 @@ =
handler used in the theft process.<br =
class=3D"">\Clnref{check:REQ,return:n} check to see if<br class=3D"">the =
\co{theft} state is REQ, and, if not<br class=3D"">returns without =
change.<br class=3D"">-\Clnref{mb:1} executes a \IX{memory barrier} to =
ensure that the sampling<br class=3D"">-of the theft variable happens =
before any change to that variable.<br class=3D"">\Clnref{set:ACK} sets =
the \co{theft} state to ACK, and, if<br class=3D"">\clnref{check:fast} =
sees that<br class=3D"">this thread's fastpaths are not running, =
\clnref{set:READY} sets the \co{theft}<br class=3D"">-state to =
READY\@.<br class=3D"">+state to READY, with the release store ensuring =
any change to counter in<br class=3D""></blockquote><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;\co{counter}</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 13px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><blockquote type=3D"cite" =
style=3D"font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D"">+the fastpath happens before the =
change of theft to READY\@.<br class=3D""></blockquote><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;\co{theft}</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D""><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 13px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" =
class=3D"">\end{fcvref}<br class=3D""><br class=3D"">\begin{listing}<br =
class=3D"">@@ -2595,9 +2594,10 @@ handlers to undertake theft.<br =
class=3D"">\Clnref{barrier:3} again disables compiler reordering, and =
then<br class=3D"">\clnref{check:ACK}<br class=3D"">checks to see if the =
signal handler deferred the \co{theft}<br class=3D"">-state-change to =
READY, and, if so, \clnref{mb} executes a memory<br class=3D"">-barrier =
to ensure that any CPU that sees \clnref{READY} setting state to<br =
class=3D"">-READY also sees the effects of \clnref{add:f}.<br =
class=3D"">+state-change to READY, and, if so, \clnref{READY} changes =
theft to<br class=3D""></blockquote><span style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&=
nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nb=
sp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp=
;\co{theft}</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 13px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 13px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 13px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">+READY =
with the release store ensuring that<br class=3D"">+any CPU that sees =
the READY state also sees the effects<br class=3D"">+of =
\clnref{add:f}.<br class=3D"">If the fastpath addition at \clnref{add:f} =
was executed, then<br class=3D"">\clnref{return:fs} returns<br =
class=3D"">success.<br class=3D""></blockquote><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 13px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">With those addressed,</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">Reviewed-by: Akira Yokosawa &lt;</span><a =
href=3D"mailto:akiyks@gmail.com" style=3D"font-family: Helvetica; =
font-size: 13px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px;" class=3D"">akiyks@gmail.com</a><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">&gt;</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Thanks, =
Akira</span></div></blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_8E44E03C-F7F4-4C2A-801E-FA392BAA1FBD--
