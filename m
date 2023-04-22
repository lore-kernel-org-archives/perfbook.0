Return-Path: <SRS0=Fz29=AN=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1682159882; x=1684751882;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=P41rtjhvziZ0onKre5YUyXufEzJnWS3yegvDoiWGZCw=;
        b=oJLPbDvvyComot7f6UclSlqi3uVutu6klyV/0Mb6fDO4zG0DgLb1mvGxgSL3CxkySL
         kYPzJk6OKWnnPu3LBL/jOaebH8/WzEQbYJ8N+3g5A0p8fwRTteRxvSV5ecRfRS7BzQ2E
         GSBGRv423bUkssSQgaT41oTIMQtxipGlYUe0v50XU9gW2hgwAYzv+KmwOCbnIYD73Wqc
         ZCL+RJhMW+OdjaDwsKrJ7WtjPMbqI0Jl9AU1scxtQ9M+bY1YDQwYIGm85zHQLhhrMCC1
         79KsTxrYYeeecU+2fqamrpBqw1rshNnQ0jMNyi0IgT7g8Cch4JplzQPKWdoRPzTAMPPv
         n0Gg==
From: Alan Huang <mmpgouride@gmail.com>
Message-Id: <D0295F75-1A1C-4940-BEAA-DFDB3997A421@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_D41B3786-F125-4B4B-A911-1EE3430D861C"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: [PATCH] CodeSamples/defer: Fix hazard torture
Date: Sat, 22 Apr 2023 18:37:36 +0800
In-Reply-To: <f4c9bb03-a9c9-cd05-dba3-503ee1a0f0bf@gmail.com>
References: <20230420072923.35042-1-mmpgouride@gmail.com>
 <f4c9bb03-a9c9-cd05-dba3-503ee1a0f0bf@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>


--Apple-Mail=_D41B3786-F125-4B4B-A911-1EE3430D861C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

Hi Akira,

I have sent out the patch v2 with a more clear commit message.

Thanks,
Alan

> 2023=E5=B9=B44=E6=9C=8822=E6=97=A5 16:28=EF=BC=8CAkira Yokosawa =
<akiyks@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> Hi Alan,
>=20
> On Thu, 20 Apr 2023 07:29:23 +0000, Alan Huang wrote:
>> This patch fixes hazard torture.
>=20
> Please describe what bug you are fixing.
>=20
>>=20
>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
>> ---
>> CodeSamples/defer/hazptr.h        | 2 +-
>> CodeSamples/defer/hazptrtorture.h | 3 +--
>> 2 files changed, 2 insertions(+), 3 deletions(-)
>>=20
>> diff --git a/CodeSamples/defer/hazptr.h b/CodeSamples/defer/hazptr.h
>> index 759ab53d..e061303d 100644
>> --- a/CodeSamples/defer/hazptr.h
>> +++ b/CodeSamples/defer/hazptr.h
>> @@ -87,7 +87,7 @@ static inline void *hp_record(void **p,			=
//\lnlbl{hr:b}
>> 	void *tmp;
>>=20
>> 	do {
>> -		tmp =3D hp_try_record(*p, hp);
>> +		tmp =3D hp_try_record(p, hp);
>=20
> This looks to me fixes the regression introduced by commit
> a082aba85ce0 ("defer/hazptr: Checkpoint for text/code update")
> made back on Apr 1, 2019.
>=20
> Was it an April fool?  I don't know, but Paul planted this bug to
> see if there is somebody who would catch it.  ;-)
>=20
>> 	} while (tmp =3D=3D (void *)HAZPTR_POISON);
>> 	return tmp;
>> }							//\lnlbl{hr:e}
>> diff --git a/CodeSamples/defer/hazptrtorture.h =
b/CodeSamples/defer/hazptrtorture.h
>> index 53efa259..29761e3d 100644
>> --- a/CodeSamples/defer/hazptrtorture.h
>> +++ b/CodeSamples/defer/hazptrtorture.h
>> @@ -241,8 +241,7 @@ DEFINE_PER_THREAD(long long =
[HAZPTR_STRESS_PIPE_LEN + 1], hazptr_stress_count);
>>=20
>> void *hazptr_read_stress_test(void *arg)
>> {
>> -	int me =3D (int)(long)arg;
>> -	int base =3D me * K;
>> +	int base =3D smp_thread_id() * K;
>=20
> I'm not sure if this change is related to the fix above.
>=20
> Or are you fixing an independent issue?  If so, can you make this part
> a follow-up patch, with the other patch squashed?
>=20
>        Thanks, Akira
>=20
>> 	struct hazptr_stress *p;
>> 	int pc;


--Apple-Mail=_D41B3786-F125-4B4B-A911-1EE3430D861C
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;">Hi =
Akira,<div><br></div><div>I have sent out the patch v2 with a more clear =
commit =
message.</div><div><br></div><div>Thanks,</div><div>Alan<br><div><br><bloc=
kquote type=3D"cite"><div>2023=E5=B9=B44=E6=9C=8822=E6=97=A5 =
16:28=EF=BC=8CAkira Yokosawa &lt;akiyks@gmail.com&gt; =E5=86=99=E9=81=93=EF=
=BC=9A</div><br class=3D"Apple-interchange-newline"><div><meta =
charset=3D"UTF-8"><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 15px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">Hi Alan,</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
15px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
15px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
15px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">On Thu, 20 Apr 2023 07:29:23 +0000, Alan =
Huang wrote:</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 15px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 15px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;">This patch fixes =
hazard torture.<br></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">Please =
describe what bug you are fixing.</span><br style=3D"caret-color: rgb(0, =
0, 0); font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 15px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: =
none;"><br>Signed-off-by: Alan Huang =
&lt;mmpgouride@gmail.com&gt;<br>---<br>CodeSamples/defer/hazptr.h =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;| 2 =
+-<br>CodeSamples/defer/hazptrtorture.h | 3 +--<br>2 files changed, 2 =
insertions(+), 3 deletions(-)<br><br>diff --git =
a/CodeSamples/defer/hazptr.h b/CodeSamples/defer/hazptr.h<br>index =
759ab53d..e061303d 100644<br>--- a/CodeSamples/defer/hazptr.h<br>+++ =
b/CodeSamples/defer/hazptr.h<br>@@ -87,7 +87,7 @@ static inline void =
*hp_record(void **p,<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>//\lnlbl{hr:b}<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>void *tmp;<br><br><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>do =
{<br>-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>tmp =3D hp_try_record(*p, hp);<br>+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>tmp =3D hp_try_record(p, =
hp);<br></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">This =
looks to me fixes the regression introduced by commit</span><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
15px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
15px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">a082aba85ce0 ("defer/hazptr: Checkpoint for =
text/code update")</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">made =
back on Apr 1, 2019.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">Was it =
an April fool? &nbsp;I don't know, but Paul planted this bug =
to</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 15px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 15px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">see if there is somebody =
who would catch it. &nbsp;;-)</span><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><blockquote type=3D"cite" style=3D"font-family: =
Helvetica; font-size: 15px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; orphans: auto; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>} while =
(tmp =3D=3D (void *)HAZPTR_POISON);<br><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>return tmp;<br>}<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>//\lnlbl{hr:e}<br>diff --git a/CodeSamples/defer/hazptrtorture.h =
b/CodeSamples/defer/hazptrtorture.h<br>index 53efa259..29761e3d =
100644<br>--- a/CodeSamples/defer/hazptrtorture.h<br>+++ =
b/CodeSamples/defer/hazptrtorture.h<br>@@ -241,8 +241,7 @@ =
DEFINE_PER_THREAD(long long [HAZPTR_STRESS_PIPE_LEN + 1], =
hazptr_stress_count);<br><br>void *hazptr_read_stress_test(void =
*arg)<br>{<br>-<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>int me =3D (int)(long)arg;<br>-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>int base =
=3D me * K;<br>+<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>int base =3D smp_thread_id() * K;<br></blockquote><br =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
15px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
15px; font-style: normal; font-variant-caps: normal; font-weight: 400; =
letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: normal; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none; float: none; =
display: inline !important;">I'm not sure if this change is related to =
the fix above.</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;">Or are =
you fixing an independent issue? &nbsp;If so, can you make this =
part</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 15px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 15px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;">a follow-up patch, with =
the other patch squashed?</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;"><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 15px; font-style: normal; =
font-variant-caps: normal; font-weight: 400; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline =
!important;">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Thanks, =
Akira</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 15px; font-style: normal; font-variant-caps: =
normal; font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><br style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 15px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;"><blockquote type=3D"cite" style=3D"font-family: Helvetica; =
font-size: 15px; font-style: normal; font-variant-caps: normal; =
font-weight: 400; letter-spacing: normal; orphans: auto; text-align: =
start; text-indent: 0px; text-transform: none; white-space: normal; =
widows: auto; word-spacing: 0px; -webkit-text-size-adjust: auto; =
-webkit-text-stroke-width: 0px; text-decoration: none;"><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>struct =
hazptr_stress *p;<br><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>int =
pc;</blockquote></div></blockquote></div><br></div></body></html>=

--Apple-Mail=_D41B3786-F125-4B4B-A911-1EE3430D861C--
