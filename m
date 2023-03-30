Return-Path: <SRS0=wcrT=7W=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112; t=1680170390;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=T3ps1+Zuzi27CqgH8QNr4T8qVqRXxeQtBO7/+9ckzwU=;
        b=hB7j3+oPiREbtarLzRPI3DQssU3PqECKo6dZ9O/2HsnTgbRTzFe0pBR9AZkPjs6uQs
         FaUVFTZwDb45onbcVT6GGyffU65doswLJddjQau5c5OTY6W7XfM9alQ9Bs/FVwozbIpz
         d9sTxF5ysSRk07i4r2vMgm/6SKS2sE10RmkcB0/gBv3usgXTHYLYaXchBCVr/YmI0eL4
         Z/qDRIzELm+s1DNZFj9UZ19vo1/FCN2Z8OLbdPhR4rnnrDHmA5gacZYILznbL6Ow5FlP
         pz+Qy8yqHCJj6O4hREUCqBuOPXpEaEN4Xezt8S/Sa3fNR341IfBqmcqsr3P7L+/Q4Lvr
         gBdw==
From: Alan Huang <mmpgouride@gmail.com>
Message-Id: <0F5FE95A-6A39-4229-ABB4-D13BEE688E94@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_FAF1EC9F-359B-43C3-94A9-5EAB3FC5F84E"
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.60.0.2.21\))
Subject: Re: [PATCH v3] CodeSamples/count: add necessary partial memory
 barriers
Date: Thu, 30 Mar 2023 17:59:37 +0800
In-Reply-To: <f42a15f4-9fee-477b-8516-8ace00a33f36@paulmck-laptop>
References: <20230328145824.632910-1-mmpgouride@gmail.com>
 <116de201-9df8-aa40-46a3-eb872bdfb9d9@gmail.com>
 <f42a15f4-9fee-477b-8516-8ace00a33f36@paulmck-laptop>
To: paulmck@kernel.org
Cc: Akira Yokosawa <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>


--Apple-Mail=_FAF1EC9F-359B-43C3-94A9-5EAB3FC5F84E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8

> Alan, would you like to drag the counting code kicking and screaming
> into the 2020s?  ;-)

I=E2=80=99d like to!

Thanks,
Alan

> 2023=E5=B9=B43=E6=9C=8830=E6=97=A5 =E4=B8=8A=E5=8D=887:18=EF=BC=8CPaul =
E. McKenney <paulmck@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Wed, Mar 29, 2023 at 08:43:33AM +0900, Akira Yokosawa wrote:
>> On Tue, 28 Mar 2023 10:58:24 -0400, Alan Huang wrote:
>>> This patch add several necessary partial memory barriers, the first =
one
>>> change READ_ONCE to smp_load_acquire to makes sure the reading from =
theftp[t]
>>> happens before the reading from counterp[t]. The litmus testing =
below
>>> represents the original code pattern, and the result is "Sometimes":
>>>=20
>>> C counter_sig
>>>=20
>>> {}
>>>=20
>>> P0(int *theft, int *counter)
>>> {
>>>    int r0;
>>>    int r1;
>>>=20
>>>    r0 =3D READ_ONCE(*theft);
>>>    r1 =3D READ_ONCE(*counter);
>>> }
>>>=20
>>> P1(int *theft, int *counter)
>>> {
>>>    WRITE_ONCE(*counter, 1);
>>>    smp_mb();
>>>    WRITE_ONCE(*theft, 1);
>>> }
>>>=20
>>> exists (0:r0=3D1 /\ 0:r1=3D0)
>>>=20
>>> Second one change WRITE_ONCE to smp_store_release to make sure that =
setting
>>> counterp[t] happens before the setting theftp[p] to THEFT_IDLE. Here =
is the
>>> litmus testing, The result is "Sometimes":
>>>=20
>>> C counter_sig_2
>>>=20
>>> {
>>>    int theft =3D 1;
>>>    int counter =3D 1;
>>> }
>>>=20
>>> P0(int *theft, int *counter)
>>> {
>>>    WRITE_ONCE(*counter, 0);
>>>    WRITE_ONCE(*theft, 0);
>>> }
>>>=20
>>> P1(int *theft, int *counter)
>>> {
>>>    if (READ_ONCE(*theft) =3D=3D 0)
>>>    {
>>>        WRITE_ONCE(*counter, READ_ONCE(*counter)+1);
>>>    }
>>> }
>>>=20
>>> P2(int *counter)
>>> {
>>>    int r0;
>>>=20
>>>    r0 =3D READ_ONCE(*counter);
>>> }
>>>=20
>>> exists (2:r0=3D2)
>>>=20
>>> Note that I also changed the reading of theft variable
>>> to smp_load_acquire in add_count/sub_count's fast path
>>> to make sure that reading theft happens before reading
>>> counter.
>>>=20
>>> Signed-off-by: Alan Huang <mmpgouride@gmail.com>
>>=20
>> Looks good to me.
>> Reviewed-by: Akira Yokosawa <akiyks@gmail.com>
>=20
> Thank you both!
>=20
>> Paul, there is a question for you.
>> Please see below.
>>=20
>>> ---
>>> CodeSamples/count/count_lim_sig.c | 8 ++++----
>>> 1 file changed, 4 insertions(+), 4 deletions(-)
>>>=20
>>> diff --git a/CodeSamples/count/count_lim_sig.c =
b/CodeSamples/count/count_lim_sig.c
>>> index 023d6215..59da8077 100644
>>> --- a/CodeSamples/count/count_lim_sig.c
>>> +++ b/CodeSamples/count/count_lim_sig.c
>>> @@ -81,7 +81,7 @@ static void flush_local_count(void)			=
//\lnlbl{flush:b}
>>> 	for_each_tid(t, tid) {				=
//\lnlbl{flush:loop2:b}
>>> 		if (theftp[t] =3D=3D NULL)			=
//\lnlbl{flush:skip:nonexist}
>>> 			continue;			=
//\lnlbl{flush:next2}
>>> -		while (READ_ONCE(*theftp[t]) !=3D THEFT_READY) =
{//\lnlbl{flush:loop3:b}
>>> +		while (smp_load_acquire(theftp[t]) !=3D THEFT_READY) =
{//\lnlbl{flush:loop3:b}
>>> 			poll(NULL, 0, 1);		=
//\lnlbl{flush:block}
>>> 			if (READ_ONCE(*theftp[t]) =3D=3D =
THEFT_REQ)//\lnlbl{flush:check:REQ}
>>> 				pthread_kill(tid, =
SIGUSR1);//\lnlbl{flush:signal2}
>>> @@ -90,7 +90,7 @@ static void flush_local_count(void)			=
//\lnlbl{flush:b}
>>> 		*counterp[t] =3D 0;
>>> 		globalreserve -=3D *countermaxp[t];
>>> 		*countermaxp[t] =3D 0;			=
//\lnlbl{flush:thiev:e}
>>> -		WRITE_ONCE(*theftp[t], THEFT_IDLE);	=
//\lnlbl{flush:IDLE}
>>> +		smp_store_release(theftp[t], THEFT_IDLE);	=
//\lnlbl{flush:IDLE}
>>> 	}						=
//\lnlbl{flush:loop2:e}
>>> }							=
//\lnlbl{flush:e}
>>>=20
>>> @@ -116,7 +116,7 @@ int add_count(unsigned long delta)			=
//\lnlbl{b}
>>>=20
>>> 	WRITE_ONCE(counting, 1);			//\lnlbl{fast:b}
>>> 	barrier();					=
//\lnlbl{barrier:1}
>>> -	if (READ_ONCE(theft) <=3D THEFT_REQ &&		=
//\lnlbl{check:b}
>>> +	if (smp_load_acquire(&theft) <=3D THEFT_REQ &&		=
//\lnlbl{check:b}
>>> 	    countermax - counter >=3D delta) {		=
//\lnlbl{check:e}
>>> 		WRITE_ONCE(counter, counter + delta);	//\lnlbl{add:f}
>>> 		fastpath =3D 1;				=
//\lnlbl{fasttaken}
>>> @@ -155,7 +155,7 @@ int sub_count(unsigned long delta)
>>>=20
>>> 	WRITE_ONCE(counting, 1);
>>> 	barrier();
>>> -	if (READ_ONCE(theft) <=3D THEFT_REQ &&
>>> +	if (smp_load_acquire(&theft) <=3D THEFT_REQ &&
>>> 	    counter >=3D delta) {
>>> 		WRITE_ONCE(counter, counter - delta);
>>> 		fastpath =3D 1;
>>=20
>> In add_count() and sub_count(), is the plain accesses to counter
>> guaranteed to see the value stored in flush_local_count()?
>>=20
>> I'm asking because counter is declared as a thread-local variable:
>>=20
>> In this code, as each of the plain loads of counter is the first
>> access to the variable in each function, there is not much room
>> for compilers to exploit the plainness, I suppose.
>>=20
>> What do you think?
>=20
> Well, gitk thinks that the last deliberate change to this code was in
> 2010, before READ_ONCE() and WRITE_ONCE(), let alone LKMM.  So it =
needs
> careful scrutiny, along with the other counting algorithms.
>=20
> This commit looks like a step in the right direction, so I am applying
> it, thank you both!
>=20
> Alan, would you like to drag the counting code kicking and screaming
> into the 2020s?  ;-)
>=20
> 							Thanx, Paul


--Apple-Mail=_FAF1EC9F-359B-43C3-94A9-5EAB3FC5F84E
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"Content-Type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"word-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: after-white-space;" =
class=3D""><blockquote type=3D"cite" class=3D""><span class=3D"" =
style=3D"float: none; display: inline !important;">Alan, would you like =
to drag the counting code kicking and screaming</span><br class=3D""><span=
 class=3D"" style=3D"float: none; display: inline !important;">into the =
2020s? &nbsp;;-)</span><br class=3D""></blockquote><div class=3D""><br =
class=3D""></div>I=E2=80=99d like to!<div class=3D""><br =
class=3D""></div><div class=3D"">Thanks,</div><div class=3D"">Alan<br =
class=3D""><div><br class=3D""><blockquote type=3D"cite" class=3D""><div =
class=3D"">2023=E5=B9=B43=E6=9C=8830=E6=97=A5 =E4=B8=8A=E5=8D=887:18=EF=BC=
=8CPaul E. McKenney &lt;<a href=3D"mailto:paulmck@kernel.org" =
class=3D"">paulmck@kernel.org</a>&gt; =E5=86=99=E9=81=93=EF=BC=9A</div><br=
 class=3D"Apple-interchange-newline"><div class=3D""><meta =
charset=3D"UTF-8" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none; float: none; display: inline !important;" =
class=3D"">On Wed, Mar 29, 2023 at 08:43:33AM +0900, Akira Yokosawa =
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
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">On =
Tue, 28 Mar 2023 10:58:24 -0400, Alan Huang wrote:<br =
class=3D""><blockquote type=3D"cite" class=3D"">This patch add several =
necessary partial memory barriers, the first one<br class=3D"">change =
READ_ONCE to smp_load_acquire to makes sure the reading from =
theftp[t]<br class=3D"">happens before the reading from counterp[t]. The =
litmus testing below<br class=3D"">represents the original code pattern, =
and the result is "Sometimes":<br class=3D""><br class=3D"">C =
counter_sig<br class=3D""><br class=3D"">{}<br class=3D""><br =
class=3D"">P0(int *theft, int *counter)<br class=3D"">{<br =
class=3D"">&nbsp;&nbsp;&nbsp;int r0;<br class=3D"">&nbsp;&nbsp;&nbsp;int =
r1;<br class=3D""><br class=3D"">&nbsp;&nbsp;&nbsp;r0 =3D =
READ_ONCE(*theft);<br class=3D"">&nbsp;&nbsp;&nbsp;r1 =3D =
READ_ONCE(*counter);<br class=3D"">}<br class=3D""><br class=3D"">P1(int =
*theft, int *counter)<br class=3D"">{<br =
class=3D"">&nbsp;&nbsp;&nbsp;WRITE_ONCE(*counter, 1);<br =
class=3D"">&nbsp;&nbsp;&nbsp;smp_mb();<br =
class=3D"">&nbsp;&nbsp;&nbsp;WRITE_ONCE(*theft, 1);<br class=3D"">}<br =
class=3D""><br class=3D"">exists (0:r0=3D1 /\ 0:r1=3D0)<br class=3D""><br =
class=3D"">Second one change WRITE_ONCE to smp_store_release to make =
sure that setting<br class=3D"">counterp[t] happens before the setting =
theftp[p] to THEFT_IDLE. Here is the<br class=3D"">litmus testing, The =
result is "Sometimes":<br class=3D""><br class=3D"">C counter_sig_2<br =
class=3D""><br class=3D"">{<br class=3D"">&nbsp;&nbsp;&nbsp;int theft =3D =
1;<br class=3D"">&nbsp;&nbsp;&nbsp;int counter =3D 1;<br class=3D"">}<br =
class=3D""><br class=3D"">P0(int *theft, int *counter)<br class=3D"">{<br =
class=3D"">&nbsp;&nbsp;&nbsp;WRITE_ONCE(*counter, 0);<br =
class=3D"">&nbsp;&nbsp;&nbsp;WRITE_ONCE(*theft, 0);<br class=3D"">}<br =
class=3D""><br class=3D"">P1(int *theft, int *counter)<br class=3D"">{<br =
class=3D"">&nbsp;&nbsp;&nbsp;if (READ_ONCE(*theft) =3D=3D 0)<br =
class=3D"">&nbsp;&nbsp;&nbsp;{<br =
class=3D"">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;WRITE_ONCE(*counter, =
READ_ONCE(*counter)+1);<br class=3D"">&nbsp;&nbsp;&nbsp;}<br =
class=3D"">}<br class=3D""><br class=3D"">P2(int *counter)<br =
class=3D"">{<br class=3D"">&nbsp;&nbsp;&nbsp;int r0;<br class=3D""><br =
class=3D"">&nbsp;&nbsp;&nbsp;r0 =3D READ_ONCE(*counter);<br =
class=3D"">}<br class=3D""><br class=3D"">exists (2:r0=3D2)<br =
class=3D""><br class=3D"">Note that I also changed the reading of theft =
variable<br class=3D"">to smp_load_acquire in add_count/sub_count's fast =
path<br class=3D"">to make sure that reading theft happens before =
reading<br class=3D"">counter.<br class=3D""><br class=3D"">Signed-off-by:=
 Alan Huang &lt;<a href=3D"mailto:mmpgouride@gmail.com" =
class=3D"">mmpgouride@gmail.com</a>&gt;<br class=3D""></blockquote><br =
class=3D"">Looks good to me.<br class=3D"">Reviewed-by: Akira Yokosawa =
&lt;<a href=3D"mailto:akiyks@gmail.com" =
class=3D"">akiyks@gmail.com</a>&gt;<br class=3D""></blockquote><br =
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
display: inline !important;" class=3D"">Thank you both!</span><br =
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
-webkit-text-stroke-width: 0px; text-decoration: none;" class=3D"">Paul, =
there is a question for you.<br class=3D"">Please see below.<br =
class=3D""><br class=3D""><blockquote type=3D"cite" class=3D"">---<br =
class=3D"">CodeSamples/count/count_lim_sig.c | 8 ++++----<br class=3D"">1 =
file changed, 4 insertions(+), 4 deletions(-)<br class=3D""><br =
class=3D"">diff --git a/CodeSamples/count/count_lim_sig.c =
b/CodeSamples/count/count_lim_sig.c<br class=3D"">index =
023d6215..59da8077 100644<br class=3D"">--- =
a/CodeSamples/count/count_lim_sig.c<br class=3D"">+++ =
b/CodeSamples/count/count_lim_sig.c<br class=3D"">@@ -81,7 +81,7 @@ =
static void flush_local_count(void)<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{flush:b}<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>for_each_tid(t, tid) {<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{flush:loop2:b}<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>if (theftp[t] =3D=3D NULL)<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{flush:skip:nonexist}<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>continue;<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>//\lnlbl{flush:next2}<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>while =
(READ_ONCE(*theftp[t]) !=3D THEFT_READY) {//\lnlbl{flush:loop3:b}<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>while (smp_load_acquire(theftp[t]) !=3D THEFT_READY) =
{//\lnlbl{flush:loop3:b}<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>poll(NULL, 0, 1);<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>//\lnlbl{flush:block}<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (READ_ONCE(*theftp[t]) =3D=3D =
THEFT_REQ)//\lnlbl{flush:check:REQ}<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>pthread_kill(tid, SIGUSR1);//\lnlbl{flush:signal2}<br class=3D"">@@=
 -90,7 +90,7 @@ static void flush_local_count(void)<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>//\lnlbl{flush:b}<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>*counterp[t] =3D 0;<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>globalreserve -=3D *countermaxp[t];<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>*countermaxp[t] =3D 0;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{flush:thiev:e}<br =
class=3D"">-<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>WRITE_ONCE(*theftp[t], THEFT_IDLE);<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{flush:IDLE}<br =
class=3D"">+<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>smp_store_release(theftp[t], THEFT_IDLE);<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>//\lnlbl{flush:IDLE}<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>}<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{flush:loop2:e}<br =
class=3D"">}<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>//\lnlbl{flush:e}<br class=3D""><br class=3D"">@@ -116,7 +116,7 =
@@ int add_count(unsigned long delta)<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{b}<br class=3D""><br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>WRITE_ONCE(counting, 1);<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{fast:b}<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>barrier();<span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>//\lnlbl{barrier:1}<br class=3D"">-<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>if =
(READ_ONCE(theft) &lt;=3D THEFT_REQ &amp;&amp;<span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>//\lnlbl{check:b}<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (smp_load_acquire(&amp;theft) =
&lt;=3D THEFT_REQ &amp;&amp;<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{check:b}<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;countermax =
- counter &gt;=3D delta) {<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>//\lnlbl{check:e}<br =
class=3D""><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>WRITE_ONCE(counter, counter + delta);<span class=3D"Apple-tab-span"=
 style=3D"white-space: pre;">	</span>//\lnlbl{add:f}<br class=3D""><span=
 class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	</span>fastpath =
=3D 1;<span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span><span class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>//\lnlbl{fasttaken}<br class=3D"">@@ -155,7 +155,7 @@ int =
sub_count(unsigned long delta)<br class=3D""><br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>WRITE_ONCE(counting, 1);<br class=3D""><span =
class=3D"Apple-tab-span" style=3D"white-space: pre;">	=
</span>barrier();<br class=3D"">-<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (READ_ONCE(theft) &lt;=3D =
THEFT_REQ &amp;&amp;<br class=3D"">+<span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>if (smp_load_acquire(&amp;theft) =
&lt;=3D THEFT_REQ &amp;&amp;<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span =
class=3D"Apple-converted-space">&nbsp;</span>&nbsp;&nbsp;&nbsp;counter =
&gt;=3D delta) {<br class=3D""><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space: pre;">	</span>WRITE_ONCE(counter, counter - =
delta);<br class=3D""><span class=3D"Apple-tab-span" style=3D"white-space:=
 pre;">	</span><span class=3D"Apple-tab-span" style=3D"white-space: =
pre;">	</span>fastpath =3D 1;<br class=3D""></blockquote><br =
class=3D"">In add_count() and sub_count(), is the plain accesses to =
counter<br class=3D"">guaranteed to see the value stored in =
flush_local_count()?<br class=3D""><br class=3D"">I'm asking because =
counter is declared as a thread-local variable:<br class=3D""><br =
class=3D"">In this code, as each of the plain loads of counter is the =
first<br class=3D"">access to the variable in each function, there is =
not much room<br class=3D"">for compilers to exploit the plainness, I =
suppose.<br class=3D""><br class=3D"">What do you think?<br =
class=3D""></blockquote><br style=3D"caret-color: rgb(0, 0, 0); =
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
class=3D"">Well, gitk thinks that the last deliberate change to this =
code was in</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 13px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 13px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">2010, before =
READ_ONCE() and WRITE_ONCE(), let alone LKMM. &nbsp;So it =
needs</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 13px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 13px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">careful =
scrutiny, along with the other counting algorithms.</span><br =
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
display: inline !important;" class=3D"">This commit looks like a step in =
the right direction, so I am applying</span><br style=3D"caret-color: =
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
class=3D"">it, thank you both!</span><br style=3D"caret-color: rgb(0, 0, =
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
class=3D"">Alan, would you like to drag the counting code kicking and =
screaming</span><br style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 13px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;" class=3D""><span style=3D"caret-color: rgb(0, 0, 0); font-family: =
Helvetica; font-size: 13px; font-style: normal; font-variant-caps: =
normal; font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">into the =
2020s? &nbsp;;-)</span><br style=3D"caret-color: rgb(0, 0, 0); =
font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><br style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
normal; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;" class=3D""><span class=3D"Apple-tab-span" =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: pre; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;">	=
</span><span class=3D"Apple-tab-span" style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
pre; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;">	</span><span class=3D"Apple-tab-span" style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 13px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: pre; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;">	</span><span class=3D"Apple-tab-span" =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: pre; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;">	=
</span><span class=3D"Apple-tab-span" style=3D"caret-color: rgb(0, 0, =
0); font-family: Helvetica; font-size: 13px; font-style: normal; =
font-variant-caps: normal; font-weight: normal; letter-spacing: normal; =
text-align: start; text-indent: 0px; text-transform: none; white-space: =
pre; word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none;">	</span><span class=3D"Apple-tab-span" style=3D"caret-color: =
rgb(0, 0, 0); font-family: Helvetica; font-size: 13px; font-style: =
normal; font-variant-caps: normal; font-weight: normal; letter-spacing: =
normal; text-align: start; text-indent: 0px; text-transform: none; =
white-space: pre; word-spacing: 0px; -webkit-text-stroke-width: 0px; =
text-decoration: none;">	</span><span class=3D"Apple-tab-span" =
style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; font-size: =
13px; font-style: normal; font-variant-caps: normal; font-weight: =
normal; letter-spacing: normal; text-align: start; text-indent: 0px; =
text-transform: none; white-space: pre; word-spacing: 0px; =
-webkit-text-stroke-width: 0px; text-decoration: none;">	=
</span><span style=3D"caret-color: rgb(0, 0, 0); font-family: Helvetica; =
font-size: 13px; font-style: normal; font-variant-caps: normal; =
font-weight: normal; letter-spacing: normal; text-align: start; =
text-indent: 0px; text-transform: none; white-space: normal; =
word-spacing: 0px; -webkit-text-stroke-width: 0px; text-decoration: =
none; float: none; display: inline !important;" class=3D"">Thanx, =
Paul</span></div></blockquote></div><br class=3D""></div></body></html>=

--Apple-Mail=_FAF1EC9F-359B-43C3-94A9-5EAB3FC5F84E--
