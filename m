Return-Path: <SRS0=naJo=73=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680620829;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=MzSaYjJ+AusPh9Vn1/DTkrLFSz8QMGPlnRI3vUtunVs=;
        b=JXp1TQZQNVEutLanBD9hOxbYlbgw2uyJPboeByKqx6lg3KgPLrSvCoqucAOrwQBbq7
         7Sgn7lruqv3pc1iV/7hNkq2wMf7K6PCnvgUplyRV40Gcr7lZVD4xtnQj28EMdj6na4Rq
         3M2guwzAq0E5itWdP+GDktTXf8bt7ch4uq7swnA3QzEam2yHWiiixBATGJ+sAIOLdAMb
         B+kTjiEJHFIOI1YRjso08oEm8FKZLTN/piGveSf9pN39GgoICdIVY02Rssppkvb1rDgd
         YnhQ+AvaAPs35aXVAv1X9dsivz8FcoKJ6YGmFDVt86nsLGRk4nSDytSkW5Fs5yehvbYg
         +S9g==
From: Alan Huang <mmpgouride@gmail.com>
Message-Id: <3F6B4EA9-F199-4873-83C9-3F99B206B77B@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_859A83B8-0687-47F4-9AB5-7328E7744A46"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH] CodeSamples/count: change full memory barrier to partial
 one
Date: Tue, 4 Apr 2023 23:07:00 +0800
In-Reply-To: <c84751a3-3237-a3f3-3c60-5d1caaff19db@gmail.com>
References: <20230404051921.1305092-1-mmpgouride@gmail.com>
 <c84751a3-3237-a3f3-3c60-5d1caaff19db@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, paulmck@kernel.org
List-ID: <perfbook.vger.kernel.org>


--Apple-Mail=_859A83B8-0687-47F4-9AB5-7328E7744A46
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Akira,

Thanks for your advice!

I=E2=80=99ll try to fix that.

Thanks,
Alan

> 2023=E5=B9=B44=E6=9C=884=E6=97=A5 =E4=B8=8B=E5=8D=887:28=EF=BC=8CAkira =
Yokosawa <akiyks@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Alan,
>=20
> Thanks for your continued efforts.
> Unfortunately, I (as a LaTeX adviser) see a couple of problems.
> Please see below.
>=20
> On Tue,  4 Apr 2023 01:19:21 -0400, Alan Huang wrote:
>> The original memory barriers in count_stat_eventual.c ensure
>> writing to global_count happens before writing to stopflag and
>> reading from stopflag happens before later reading from global_count.
>>=20
>> Thus, smp_load_acquire and smp_store_release will suffice.
>>=20
>> In count_lim_sig.c, there is only one ordering required, that is
>> writing to counter happens before setting theft to THEFT_READY in
>> add_count/sub_count's fast path. Therefore, partial memory barrier
>> will suffice.
>>=20
>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
>> ---
>> CodeSamples/count/count_lim_sig.c       | 10 +++-------
>> CodeSamples/count/count_stat_eventual.c |  6 ++----
>> 2 files changed, 5 insertions(+), 11 deletions(-)
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
>=20
> Removing a line that has //\lnlbl{foo} from a code snippet will cause
> warnings of "Reference ... undefined on ...".
>=20
> I think you will see warnings that look like:
>=20
>    ----- Excerpt around remaining warning messages -----
>    [63]
>    <count/sig-theft.pdf, id=3D5442, 172.645pt x 234.8775pt>
>    File: count/sig-theft.pdf Graphic file (type pdf)
>    <use count/sig-theft.pdf>
>    Package pdftex.def Info: count/sig-theft.pdf  used on input line =
2303.
>    (pdftex.def)             Requested size: 172.64456pt x 234.87692pt.
>     [64 <./count/sig-theft.pdf>] =
(./CodeSamples/count/count_lim_sig@data.fcv =
<mailto:CodeSamples/count/count_lim_sig@data.fcv>)
>=20
>    LaTeX Warning: Reference =
`ln:count:count_lim_sig:migration:flush_sig:mb:1' on p
>    age 65 undefined on input line 2428.
>=20
>    [...]
>=20
> You need to update text-side references to the to-be-removed label.
> You will likely need to adjust wording in surrounding text as well.
>=20
> If you are wondering how these labels in code snippets can be
> referenced from LaTeX sources, please see Appendix D.3.1.1.
>=20
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
>=20
> Ditto.
>=20
> Can you submit a v2 including text-side updates?
>=20
> In the meantime, I'll review your code changes.
>=20
>        Thanks, Akira
>=20
>=20
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
>> diff --git a/CodeSamples/count/count_stat_eventual.c =
b/CodeSamples/count/count_stat_eventual.c
>> index 967644de..7157ee0e 100644
>> --- a/CodeSamples/count/count_stat_eventual.c
>> +++ b/CodeSamples/count/count_stat_eventual.c
>> @@ -51,8 +51,7 @@ void *eventual(void *arg)				=
//\lnlbl{eventual:b}
>> 		WRITE_ONCE(global_count, sum);
>> 		poll(NULL, 0, 1);
>> 		if (READ_ONCE(stopflag)) {
>> -			smp_mb();
>> -			WRITE_ONCE(stopflag, stopflag + 1);
>> +			smp_store_release(&stopflag, stopflag + 1);
>> 		}
>> 	}
>> 	return NULL;
>> @@ -73,9 +72,8 @@ void count_init(void)					=
//\lnlbl{init:b}
>> void count_cleanup(void)				=
//\lnlbl{cleanup:b}
>> {
>> 	WRITE_ONCE(stopflag, 1);
>> -	while (READ_ONCE(stopflag) < 3)
>> +	while (smp_load_acquire(&stopflag) < 3)
>> 		poll(NULL, 0, 1);
>> -	smp_mb();
>> }							=
//\lnlbl{cleanup:e}
>> //\end{snippet}


--Apple-Mail=_859A83B8-0687-47F4-9AB5-7328E7744A46
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" class=3D"">Hi =
Akira,<div class=3D""><br class=3D""></div><div class=3D"">Thanks for =
your advice!</div><div class=3D""><br class=3D""></div><div =
class=3D"">I=E2=80=99ll try to fix that.</div><div class=3D""><br =
class=3D""></div><div class=3D"">Thanks,</div><div class=3D"">Alan<br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">2023=E5=B9=B44=E6=9C=884=E6=97=A5 =E4=B8=8B=E5=8D=887:28=EF=BC=8C=
Akira Yokosawa &lt;<a href=3D"mailto:akiyks@gmail.com" =
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
class=3D"">Thanks for your continued efforts.</span><br =
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
display: inline !important;" class=3D"">Unfortunately, I (as a LaTeX =
adviser) see a couple of problems.</span><br style=3D"caret-color: =
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
class=3D"">Please see below.</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 13px; font-style: normal; =
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
class=3D"">On Tue, &nbsp;4 Apr 2023 01:19:21 -0400, Alan Huang =
wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 13px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 13px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">The =
original memory barriers in count_stat_eventual.c ensure<br =
class=3D"">writing to global_count happens before writing to stopflag =
and<br class=3D"">reading from stopflag happens before later reading =
from global_count.<br class=3D""><br class=3D"">Thus, smp_load_acquire =
and smp_store_release will suffice.<br class=3D""><br class=3D"">In =
count_lim_sig.c, there is only one ordering required, that is<br =
class=3D"">writing to counter happens before setting theft to =
THEFT_READY in<br class=3D"">add_count/sub_count's fast path. Therefore, =
partial memory barrier<br class=3D"">will suffice.<br class=3D""><br =
class=3D"">Signed-off-by: Alan Huang &lt;<a =
href=3D"mailto:mmpgouride@gmail.com" =
class=3D"">mmpgouride@gmail.com</a>&gt;<br class=3D"">---<br =
class=3D"">CodeSamples/count/count_lim_sig.c =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 10 +++-------<br =
class=3D"">CodeSamples/count/count_stat_eventual.c | &nbsp;6 ++----<br =
class=3D"">2 files changed, 5 insertions(+), 11 deletions(-)<br =
class=3D""><br class=3D"">diff --git a/CodeSamples/count/count_lim_sig.c =
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
pre;">	</span>//\lnlbl{flush_sig:mb:1}<br class=3D""></blockquote><br =
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
display: inline !important;" class=3D"">Removing a line that has =
//\lnlbl{foo} from a code snippet will cause</span><br =
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
display: inline !important;" class=3D"">warnings of "Reference ... =
undefined on ...".</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">I think you will see warnings that look like:</span><br =
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
display: inline !important;" class=3D"">&nbsp;&nbsp;&nbsp;----- Excerpt =
around remaining warning messages -----</span><br style=3D"caret-color: =
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
class=3D"">&nbsp;&nbsp;&nbsp;[63]</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&lt;count/sig-theft.pdf, id=3D5442, =
172.645pt x 234.8775pt&gt;</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">&nbsp;&nbsp;&nbsp;File: count/sig-theft.pdf Graphic file =
(type pdf)</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 13px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 13px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;&lt;use count/sig-theft.pdf&gt;</span><br =
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
display: inline !important;" class=3D"">&nbsp;&nbsp;&nbsp;Package =
pdftex.def Info: count/sig-theft.pdf &nbsp;used on input line =
2303.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 13px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 13px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" =
class=3D"">&nbsp;&nbsp;&nbsp;(pdftex.def) =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Re=
quested size: 172.64456pt x 234.87692pt.</span><br style=3D"caret-color: =
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
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;[64 &lt;./count/sig-theft.pdf&gt;] =
(./</span><a href=3D"mailto:CodeSamples/count/count_lim_sig@data.fcv" =
style=3D"font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
orphans: auto; text-align: start; text-indent: 0px; text-transform: =
none; white-space: normal; widows: auto; word-spacing: 0px; =
-webkit-text-size-adjust: auto; -webkit-text-stroke-width: 0px;" =
class=3D"">CodeSamples/count/count_lim_sig@data.fcv</a><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;" class=3D"">)</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 13px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
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
class=3D"">&nbsp;&nbsp;&nbsp;LaTeX Warning: Reference =
`ln:count:count_lim_sig:migration:flush_sig:mb:1' on p</span><br =
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
display: inline !important;" class=3D"">&nbsp;&nbsp;&nbsp;age 65 =
undefined on input line 2428.</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 13px; font-style: normal; =
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
class=3D"">&nbsp;&nbsp;&nbsp;[...]</span><br style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 13px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
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
class=3D"">You need to update text-side references to the to-be-removed =
label.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 13px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 13px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">You will =
likely need to adjust wording in surrounding text as well.</span><br =
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
display: inline !important;" class=3D"">If you are wondering how these =
labels in code snippets can be</span><br style=3D"caret-color: rgb(0, 0, =
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
class=3D"">referenced from LaTeX sources, please see Appendix =
D.3.1.1.</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
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
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D""><span =
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
pre;">	</span>//\lnlbl{mb}<br class=3D""></blockquote><br =
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
display: inline !important;" class=3D"">Ditto.</span><br =
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
display: inline !important;" class=3D"">Can you submit a v2 including =
text-side updates?</span><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">In the meantime, I'll review your code changes.</span><br =
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
Akira</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 13px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
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
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>WRITE_ONCE(theft, THEFT_READY);<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{READY}<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>smp_store_release(&amp;theft, THEFT_READY);<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
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
--git a/CodeSamples/count/count_stat_eventual.c =
b/CodeSamples/count/count_stat_eventual.c<br class=3D"">index =
967644de..7157ee0e 100644<br class=3D"">--- =
a/CodeSamples/count/count_stat_eventual.c<br class=3D"">+++ =
b/CodeSamples/count/count_stat_eventual.c<br class=3D"">@@ -51,8 +51,7 =
@@ void *eventual(void *arg)<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{eventual:b}<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>WRITE_ONCE(global_count, sum);<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>poll(NULL, 0, 1);<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (READ_ONCE(stopflag)) {<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>smp_mb();<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>WRITE_ONCE(stopflag, stopflag + =
1);<br class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>smp_store_release(&amp;stopflag, stopflag + 1);<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>}<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>return =
NULL;<br class=3D"">@@ -73,9 +72,8 @@ void count_init(void)<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>//\lnlbl{init:b}<br class=3D"">void count_cleanup(void)<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>//\lnlbl{cleanup:b}<br class=3D"">{<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>WRITE_ONCE(stopflag, 1);<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>while =
(READ_ONCE(stopflag) &lt; 3)<br class=3D"">+<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>while =
(smp_load_acquire(&amp;stopflag) &lt; 3)<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>poll(NULL, 0, 1);<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>smp_mb();<br class=3D"">}<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>//\lnlbl{cleanup:e}<br =
class=3D"">//\end{snippet}</blockquote></div></blockquote></div><br =
class=3D""></div></body></html>=

--Apple-Mail=_859A83B8-0687-47F4-9AB5-7328E7744A46--
