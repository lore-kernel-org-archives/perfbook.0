Return-Path: <artpol84@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:references:in-reply-to:from:date:message-id:subject:to
 :cc;        bh=+edY9qutJWV8A8RUYgldaX+h3sCtyCIYPmrbTCBNZOo=;
 b=qAS1u2T94EsLBeBX2c1M/2NQp33WOU6pJCp1NmZtqguKCgbuEYDqjcNRj2eFkpVMqD
 smpu+7yUHJwyuKUDgn6amzQfp7IO6eJV5P8i6/MEl/WxaHWf6AmkH8WYZGBxy6b6c65G
 03vB7/kp204ewK+/Bg3a5BQumYqGBmVwIhVK9M9MnaQWTPU1SC5Sukugw54aF7kGg8/z
 6MQuEANDBUJ7y3wKZbiNNvkEpuU2vlZS0itm61iy0XgNJd+qh1r5LgtGRdGH3vt31xKu
 NWKZKB+WiggQqZ3cv790H/19KCFLfSJpYA/8Gd7+/HunYAuhhM71H/6E1KriGjX7yGEO
 491g==
MIME-Version: 1.0
References: 
 <CAJ2Qj5qej+kBZxpy4cUbKVE3NJAnOSc9FZ5wur_rKVU_rnYhVw@mail.gmail.com>
 <20180723023753.GJ12945@linux.vnet.ibm.com>
In-Reply-To: <20180723023753.GJ12945@linux.vnet.ibm.com>
From: Artem Polyakov <artpol84@gmail.com>
Date: Sun, 22 Jul 2018 21:52:27 -0700
Message-ID: 
 <CAJ2Qj5qCC11ZfE5m1-i1DCegFV=CYm1yP7vDXrjEdPqqxPrF-w@mail.gmail.com>
Subject: Re: Memory barrier pairing question
Content-Type: multipart/alternative; boundary="0000000000008120680571a36a7b"
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

--0000000000008120680571a36a7b
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Thank you, Paul!

I was wondering why in the following tutorial (section 4.4):
https://www.cl.cam.ac.uk/~pes20/ppc-supplemental/test7.pdf
They were putting "if ( r1 =3D=3D r1)" before "isync" and your explanation
makes it less confusing.

What was (and somewhat still) confusing in Power ISA (v2.07) is the
isync description:
"Executing an isync instruction ensures that all instructions preceding the
isync instruction have completed before the isync instruction completes,
and that no subsequent instructions are initiated until after the isync
instruction completes."
The term "completes" I guess was understood by me as "committed", but
according to your explanation, it only means that the instruction is deep
enough in the pipeline to ensure it's successful commit in the future. And
the same is with the phrase "no subsequent instructions are initiated until
after the isync instruction completes". The term "completion" seems obscure
to me.

But you did get my question perfectly precise and thank you once again!

=D0=B2=D1=81, 22 =D0=B8=D1=8E=D0=BB=D1=8F 2018 =D0=B3. =D0=B2 19:37, Paul E=
. McKenney <paulmck@linux.vnet.ibm.com>:

> On Sun, Jul 22, 2018 at 06:42:45PM -0700, Artem Polyakov wrote:
> > Hello,
> > I have a question about the following scenario (considering POWER arch)=
:
> >
> > initial { x =3D 0; y =3D 0; }
> >
> > thread0 {
> >     x =3D 1;
> >     lwsync;
> >     y =3D 1;
> > }
> >
> > thread1 {
> >     a =3D y;
> >     isync;
> >     b =3D x;
> > }
> >
> > Because "isync" is not a memory barrier this example doesn't have
> > read/write barrier pairing. However, if I understand correctly, lwsync
> will
> > ensure that "x =3D 1" will become visible to thread1 before lwsync is d=
one
> > and before "y =3D 1" will become visible. So "isync" here can be sort o=
f
> > control dependency as it ensures that "a =3D y" will be performed befor=
e
> "b =3D
> > x" and even will flush the pipeline according to POWER9 spec.
> >
> > Can someone comment on this scenario and tell if I am right or where I =
am
> > wrong.
>
> I am not a Power hardware architect, but here is my understanding.
>
> The isync waits until all the prior instructions "execute", but for
> a limited definition of "execute".  One way to think of isync is as
> an instruction that does not allow subsequent instructions to start
> until it can be proven that execution really will reach the isync
> instruction.
>
> So given a load, how could it be that execution would be prevented
> from reaching the isync instruction?  One possibility is a SEGV.
> But once address translation completes successfully, SEGV cannot
> happen.  So isync doesn't need to wait for the load to return an
> actual value, but instead only for its execution to reach a point
> where the hardware knows that a value will eventually be returned.
>
> And that is why you need a compare and conditional branch before the
> isync to ensure that the load has completed.  In that case, the
> hardware cannot prove that execution will actually reach the isync
> until the load completes, the compare sets the condition code,
> and the branch condition is evaluated.  Therefore, anything after
> the compare-branch-isync series cannot start executing until after
> the load returns its value.
>
> Make sense, or am I missing the point of your question?
>
>                                                         Thanx, Paul
>
>

--0000000000008120680571a36a7b
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div><div dir=3D"auto">Thank you, Paul!</div></div><div di=
r=3D"auto"><br></div><div dir=3D"auto">I was wondering why in the following=
 tutorial (section 4.4):</div><div dir=3D"auto"><a href=3D"https://www.cl.c=
am.ac.uk/~pes20/ppc-supplemental/test7.pdf">https://www.cl.cam.ac.uk/~pes20=
/ppc-supplemental/test7.pdf</a><br></div><div dir=3D"auto">They were puttin=
g &quot;if ( r1 =3D=3D r1)&quot; before &quot;isync&quot; and your explanat=
ion makes it less confusing.<br></div><div dir=3D"auto"><br></div><div>What=
 was (and somewhat still) confusing in Power ISA (v2.07) is the isync=C2=A0=
description:</div><div>&quot;Executing an isync instruction ensures that al=
l instructions preceding the isync instruction have completed before the is=
ync instruction completes, and that no subsequent instructions are initiate=
d until after the=C2=A0isync instruction completes.&quot;</div><div>The ter=
m &quot;completes&quot; I guess was understood by me as &quot;committed&quo=
t;, but according to your explanation,=C2=A0it only means that the instruct=
ion is deep enough in the pipeline to ensure it&#39;s successful commit in =
the future. And the same is with the phrase &quot;<span style=3D"font-size:=
small;background-color:rgb(255,255,255);text-decoration-style:initial;text-=
decoration-color:initial;float:none;display:inline">no subsequent instructi=
ons are initiated until after the=C2=A0</span><span class=3D"gmail-gr_ gmai=
l-gr_234 gmail-gr-alert gmail-gr_spell gmail-gr_inline_cards gmail-gr_run_a=
nim gmail-ContextualSpelling gmail-ins-del gmail-multiReplace" id=3D"gmail-=
234" style=3D"display:inline;font-size:small;border-bottom:2px solid transp=
arent;background-repeat:no-repeat;background-color:rgb(255,255,255);text-de=
coration-style:initial;text-decoration-color:initial">isync</span><span sty=
le=3D"font-size:small;background-color:rgb(255,255,255);text-decoration-sty=
le:initial;text-decoration-color:initial;float:none;display:inline"><span>=
=C2=A0</span>instruction completes&quot;. The term &quot;completion&quot; s=
eems obscure to me.</span></div><div><span style=3D"font-size:small;backgro=
und-color:rgb(255,255,255);text-decoration-style:initial;text-decoration-co=
lor:initial;float:none;display:inline"><br></span></div><div><span style=3D=
"font-size:small;background-color:rgb(255,255,255);text-decoration-style:in=
itial;text-decoration-color:initial;float:none;display:inline">But you did =
get my=C2=A0question perfectly precise and thank you once again!</span></di=
v><div><br><div class=3D"gmail_quote"><div dir=3D"ltr">=D0=B2=D1=81, 22 =D0=
=B8=D1=8E=D0=BB=D1=8F 2018 =D0=B3. =D0=B2 19:37, Paul E. McKenney &lt;<a hr=
ef=3D"mailto:paulmck@linux.vnet.ibm.com" target=3D"_blank">paulmck@linux.vn=
et.ibm.com</a>&gt;:<br></div><blockquote class=3D"gmail_quote" style=3D"mar=
gin:0px 0px 0px 0.8ex;border-left:1px solid rgb(204,204,204);padding-left:1=
ex">On Sun, Jul 22, 2018 at 06:42:45PM -0700, Artem Polyakov wrote:<br>
&gt; Hello,<br>
&gt; I have a question about the following scenario (considering POWER arch=
):<br>
&gt; <br>
&gt; initial { x =3D 0; y =3D 0; }<br>
&gt; <br>
&gt; thread0 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0x =3D 1;<br>
&gt;=C2=A0 =C2=A0 =C2=A0lwsync;<br>
&gt;=C2=A0 =C2=A0 =C2=A0y =3D 1;<br>
&gt; }<br>
&gt; <br>
&gt; thread1 {<br>
&gt;=C2=A0 =C2=A0 =C2=A0a =3D y;<br>
&gt;=C2=A0 =C2=A0 =C2=A0isync;<br>
&gt;=C2=A0 =C2=A0 =C2=A0b =3D x;<br>
&gt; }<br>
&gt; <br>
&gt; Because &quot;isync&quot; is not a memory barrier this example doesn&#=
39;t have<br>
&gt; read/write barrier pairing. However, if I understand correctly, lwsync=
 will<br>
&gt; ensure that &quot;x =3D 1&quot; will become visible to thread1 before =
lwsync is done<br>
&gt; and before &quot;y =3D 1&quot; will become visible. So &quot;isync&quo=
t; here can be sort of<br>
&gt; control dependency as it ensures that &quot;a =3D y&quot; will be perf=
ormed before &quot;b =3D<br>
&gt; x&quot; and even will flush the pipeline according to POWER9 spec.<br>
&gt; <br>
&gt; Can someone comment on this scenario and tell if I am right or where I=
 am<br>
&gt; wrong.<br>
<br>
I am not a Power hardware architect, but here is my understanding.<br>
<br>
The isync waits until all the prior instructions &quot;execute&quot;, but f=
or<br>
a limited definition of &quot;execute&quot;.=C2=A0 One way to think of isyn=
c is as<br>
an instruction that does not allow subsequent instructions to start<br>
until it can be proven that execution really will reach the isync<br>
instruction.<br>
<br>
So given a load, how could it be that execution would be prevented<br>
from reaching the isync instruction?=C2=A0 One possibility is a SEGV.<br>
But once address translation completes successfully, SEGV cannot<br>
happen.=C2=A0 So isync doesn&#39;t need to wait for the load to return an<b=
r>
actual value, but instead only for its execution to reach a point<br>
where the hardware knows that a value will eventually be returned.<br>
<br>
And that is why you need a compare and conditional branch before the<br>
isync to ensure that the load has completed.=C2=A0 In that case, the<br>
hardware cannot prove that execution will actually reach the isync<br>
until the load completes, the compare sets the condition code,<br>
and the branch condition is evaluated.=C2=A0 Therefore, anything after<br>
the compare-branch-isync series cannot start executing until after<br>
the load returns its value.<br>
<br>
Make sense, or am I missing the point of your question?<br>
<br>
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Thanx, Paul<br>
<br>
</blockquote></div></div>
</div>

--0000000000008120680571a36a7b--

