Return-Path: <SRS0=pRlB=AY=gmail.com=mmpgouride@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1683089838; x=1685681838;
        h=references:to:cc:in-reply-to:date:subject:mime-version:message-id
         :from:from:to:cc:subject:date:message-id:reply-to;
        bh=OE0/i31l5etKzg03d+zSQeT6bVc1nuPcgjFPwdUVo3g=;
        b=VPpnNZrMDG7D2ladMk/BpXBQU/34YwLgKR8NAbkAOgOK8rPgU2DUkhPUpiOaG+FBuf
         py8cAf2eDH56YvNPbkveQekj8Fvw9afiCcVUd2D/W4ceMRcjqMIgMbBQm+PlhT2pvmfS
         crFryf7g8Je3WYkUS6+OXOs+7bOjoZqXe8p1SSyLIGfpYLNwPJslIAfZXkhSRpeTq6rD
         o5swQTvQWx6ZZ9ezidprZCvtldbXth3oCnEEG7g5+cjGaIlUIByz1GfPyZozkhbHKnD8
         OiQCiQ3UqEz1VfNFhwdpAE4mulniwetoAqpHVBTNUpfCjpszZ8VAO04q0iQASM7wklS6
         pXTg==
From: Alan Huang <mmpgouride@gmail.com>
Message-Id: <886A4B67-A7F7-4BBE-8D11-A8DD9E602012@gmail.com>
Content-Type: multipart/alternative;
	boundary="Apple-Mail=_8D07C09B-03B7-49B9-A9D4-A18D8C12CFC4"
Mime-Version: 1.0 (Mac OS X Mail 16.0 \(3731.400.51.1.1\))
Subject: Re: Question: Are there conflicts between the paragraph and the
 figure?
Date: Wed, 3 May 2023 12:57:00 +0800
In-Reply-To: <0e0bea6c-c190-4a86-80ef-e11d6f0f0e3f@paulmck-laptop>
References: <6FC864F5-A6CD-4C5F-BC63-9670AB95F8F7@gmail.com>
 <6146DDCA-450B-43A1-8158-2D8766E3B86F@gmail.com>
 <3083120a-7c17-4349-9389-7ebde03676de@paulmck-laptop>
 <AE67636E-D24E-4174-AF1C-98123161823F@gmail.com>
 <203d3e8b-f75b-460c-8a28-5a3b72121cff@paulmck-laptop>
 <2B23416A-3E98-46A3-85DE-77D397A06FE7@gmail.com>
 <0e0bea6c-c190-4a86-80ef-e11d6f0f0e3f@paulmck-laptop>
To: paulmck@kernel.org
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>


--Apple-Mail=_8D07C09B-03B7-49B9-A9D4-A18D8C12CFC4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain;
	charset=utf-8



> 2023=E5=B9=B45=E6=9C=883=E6=97=A5 12:44=EF=BC=8CPaul E. McKenney =
<paulmck@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>=20
> On Wed, May 03, 2023 at 12:31:05PM +0800, Alan Huang wrote:
>>=20
>>=20
>>> 2023=E5=B9=B45=E6=9C=883=E6=97=A5 01:28=EF=BC=8CPaul E. McKenney =
<paulmck@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>=20
>>> On Tue, May 02, 2023 at 11:51:33PM +0800, Alan Huang wrote:
>>>>=20
>>>>=20
>>>>> 2023=E5=B9=B45=E6=9C=882=E6=97=A5 03:02=EF=BC=8CPaul E. McKenney =
<paulmck@kernel.org> =E5=86=99=E9=81=93=EF=BC=9A
>>>>>=20
>>>>> On Mon, May 01, 2023 at 07:09:49PM +0800, Alan Huang wrote:
>>>>>>=20
>>>>>>> 2023=E5=B9=B45=E6=9C=881=E6=97=A5 =E4=B8=8B=E5=8D=887:05=EF=BC=8CA=
lan Huang <mmpgouride@gmail.com> =E5=86=99=E9=81=93=EF=BC=9A
>>>>>>>=20
>>>>>>> Hi,
>>>>>>>=20
>>>>>>> I=E2=80=99m reading section 9.5.4.9, in the second to the last =
paragraph, there is:
>>>>>>>=20
>>>>>>> Before the first horizontal line, all readers see the leftmost =
myconfig structure,
>>>>>>> and after the second horizontal line, all readers will see the =
rightmost structure.=20
>>>>>>> Between the two lines, that is, during the grace period, =
different readers might see different objects
>>>>>>>=20
>>>>>>> I=E2=80=99m a little confused, in Figure 9.29, the xchg is =
before the first horizontal line, in my understanding, if the=20
>>>>>>> reader=E2=80=99s reading is before the xchg, it will read the =
leftmost myconfg structure.
>>>>>>=20
>>>>>> And if reader=E2=80=99s reading is after the xchg, it will see =
the rightmost structure, and because xchg is before the first horizontal =
line,
>>>>>> Readers before the first horizontal line may also see the =
rightmost structure.
>>>>>>=20
>>>>>>>=20
>>>>>>> So, are there some conflicts between the paragraph and the =
figure?
>>>>>>>=20
>>>>>>> Please correct me if I=E2=80=99m wrong.
>>>>>=20
>>>>> Consider the point in time just before the left-hand reader's
>>>>> rcu_read_unlock() and just after the right-hand reader's =
rcu_read_lock().
>>>>> These two readers are both running at that time, and one of those =
readers
>>>>> sees the old state and the other sees the new state.
>>>>=20
>>>> The sentence that may lead to conflict is this one from the =
original text:
>>>>=20
>>>> Before the first horizontal line, all readers see the leftmost =
myconfig structure.
>>>>=20
>>>> There may be a situation where:
>>>>=20
>>>>       mcp =3D xchg(&curconfig, mcp);
>>>> rcu_read_lock();=20
>>>> mcp =3D =E2=80=A6
>>>> *cur_a =3D mcp->a;=20
>>>> -------------------------------------------------first horizontal =
line-------------------------------------------------
>>>>=20
>>>> So, the reader will see the rightmost myconfig structure although =
it is before the first horizontal line.
>>>=20
>>> Ah, I understand now, good catch and thank you!  I updated that =
paragraph
>>> to the following, with your Reported-by:
>>>=20
>>> The two horizontal grey dashed lines represent the period of time
>>> during which different readers get different results, however,
>>> each reader will see one and only one of the two objects. All
>>> readers that end before the first horizontal line will see the
>>=20
>>=20
>> How about this:
>>=20
>>        				mcp =3D xchg(&curconfig, mcp);
>> 	rcu_read_lock();=20
>> 	mcp =3D =E2=80=A6
>> 	*cur_a =3D mcp->a;=20
>> 	rcu_read_unlock();
>> -------------------------------------------------first horizontal =
line-------------------------------------------------
>>=20
>> The reader above end before the first horizontal line, but still get =
the rightmost myconfig structure.
>>=20
>> The point is that there is a time period between xchg and the first =
horizontal line during which a reader
>> will see the rightmost myconfig structure.=20
>>=20
>> One possible solution is to move xchg behind the first horizontal =
line, assuming that I understand correctly.
>=20
> Yes, it would in some sense be more accurate to run that horizontal =
line
> right through the "mcp =3D xchg(&curconfig, mcp);".
>=20
> But can you do that so that the diagram looks OK and is legible?


I will do my best to do it

Thanks,
Alan


>=20
> 							Thanx, Paul
>=20
>>> leftmost myconfig structure, and all readers that start after the
>>> second horizontal line will see the rightmost structure. Between
>>> the two lines, that is, during the grace period, different readers
>>> might see different objects, but as long as each reader loads the
>>> curconfig pointer only once, each reader will see a consistent
>>> view of its myconfig structure.
>>>=20
>>> Does that help?
>>>=20
>>>> BTW, the original text says that black dotted arrows pointing from =
an older event to a newer event,=20
>>>> but there exists two black dotted arrows in the wrong direction:
>>>>=20
>>>> 1.The arrow pointing from synchronize_rcu() to left-hand =
rcu_read_lock()
>>>> 2.The arrow pointing right-hand rcu_read_lock() to =
synchronize_rcu()=20
>>>>=20
>>>> The directions of the two arrows above may need to be adjusted. I =
tried to modify this, but after a few hours, I still can=E2=80=99t =
figure out the svg...
>>>=20
>>> The trick is to use an SVG editor.  For better or for worse, I use
>>> inkscape.  But easy for me to change, so I did, again, with your
>>> Reported-by.
>>>=20
>>> The trick is to flip each arrow horizontally and then vertically, =
which
>>> reverses the direction without having to test one's manual =
dexterity,
>>> which I lack in abundance.  ;-)
>>=20
>>=20
>> Thanks for the tricks, will try to use it!
>>=20
>> Thanks,
>> Alan
>>=20
>>>=20
>>> Thanx, Paul
>>>=20
>>>> Thanks,
>>>> Alan
>>>>=20
>>>>>=20
>>>>> Does that help, or am I missing the point of your question?
>>>>>=20
>>>>> Thanx, Paul
>>=20
>>=20


--Apple-Mail=_8D07C09B-03B7-49B9-A9D4-A18D8C12CFC4
Content-Transfer-Encoding: quoted-printable
Content-Type: text/html;
	charset=utf-8

<html><head><meta http-equiv=3D"content-type" content=3D"text/html; =
charset=3Dutf-8"></head><body style=3D"overflow-wrap: break-word; =
-webkit-nbsp-mode: space; line-break: =
after-white-space;"><br><div><br><blockquote =
type=3D"cite"><div>2023=E5=B9=B45=E6=9C=883=E6=97=A5 12:44=EF=BC=8CPaul =
E. McKenney &lt;paulmck@kernel.org&gt; =E5=86=99=E9=81=93=EF=BC=9A</div><b=
r class=3D"Apple-interchange-newline"><div><div>On Wed, May 03, 2023 at =
12:31:05PM +0800, Alan Huang wrote:<br><blockquote =
type=3D"cite"><br><br><blockquote type=3D"cite">2023=E5=B9=B45=E6=9C=883=E6=
=97=A5 01:28=EF=BC=8CPaul E. McKenney &lt;paulmck@kernel.org&gt; =
=E5=86=99=E9=81=93=EF=BC=9A<br><br>On Tue, May 02, 2023 at 11:51:33PM =
+0800, Alan Huang wrote:<br><blockquote type=3D"cite"><br><br><blockquote =
type=3D"cite">2023=E5=B9=B45=E6=9C=882=E6=97=A5 03:02=EF=BC=8CPaul E. =
McKenney &lt;paulmck@kernel.org&gt; =E5=86=99=E9=81=93=EF=BC=9A<br><br>On =
Mon, May 01, 2023 at 07:09:49PM +0800, Alan Huang wrote:<br><blockquote =
type=3D"cite"><br><blockquote type=3D"cite">2023=E5=B9=B45=E6=9C=881=E6=97=
=A5 =E4=B8=8B=E5=8D=887:05=EF=BC=8CAlan Huang =
&lt;mmpgouride@gmail.com&gt; =E5=86=99=E9=81=93=EF=BC=9A<br><br>Hi,<br><br=
>I=E2=80=99m reading section 9.5.4.9, in the second to the last =
paragraph, there is:<br><br>Before the first horizontal line, all =
readers see the leftmost myconfig structure,<br>and after the second =
horizontal line, all readers will see the rightmost structure. =
<br>Between the two lines, that is, during the grace period, different =
readers might see different objects<br><br>I=E2=80=99m a little =
confused, in Figure 9.29, the xchg is before the first horizontal line, =
in my understanding, if the <br>reader=E2=80=99s reading is before the =
xchg, it will read the leftmost myconfg =
structure.<br></blockquote><br>And if reader=E2=80=99s reading is after =
the xchg, it will see the rightmost structure, and because xchg is =
before the first horizontal line,<br>Readers before the first horizontal =
line may also see the rightmost structure.<br><br><blockquote =
type=3D"cite"><br>So, are there some conflicts between the paragraph and =
the figure?<br><br>Please correct me if I=E2=80=99m =
wrong.<br></blockquote></blockquote><br>Consider the point in time just =
before the left-hand reader's<br>rcu_read_unlock() and just after the =
right-hand reader's rcu_read_lock().<br>These two readers are both =
running at that time, and one of those readers<br>sees the old state and =
the other sees the new state.<br></blockquote><br>The sentence that may =
lead to conflict is this one from the original text:<br><br>Before the =
first horizontal line, all readers see the leftmost myconfig =
structure.<br><br>There may be a situation where:<br><br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;mcp =3D xchg(&amp;curconfig, =
mcp);<br>rcu_read_lock(); <br>mcp =3D =E2=80=A6<br>*cur_a =3D mcp-&gt;a; =
<br>-------------------------------------------------first horizontal =
line-------------------------------------------------<br><br>So, the =
reader will see the rightmost myconfig structure although it is before =
the first horizontal line.<br></blockquote><br>Ah, I understand now, =
good catch and thank you! &nbsp;I updated that paragraph<br>to the =
following, with your Reported-by:<br><br>The two horizontal grey dashed =
lines represent the period of time<br>during which different readers get =
different results, however,<br>each reader will see one and only one of =
the two objects. All<br>readers that end before the first horizontal =
line will see the<br></blockquote><br><br>How about this:<br><br> =
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mcp =3D xchg(&amp;curconfig, =
mcp);<br><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>rcu_read_lock(); <br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>mcp =3D =E2=80=A6<br><span =
class=3D"Apple-tab-span" style=3D"white-space:pre">	</span>*cur_a =3D =
mcp-&gt;a; <br><span class=3D"Apple-tab-span" style=3D"white-space:pre">	=
</span>rcu_read_unlock();<br>---------------------------------------------=
----first horizontal =
line-------------------------------------------------<br><br>The reader =
above end before the first horizontal line, but still get the rightmost =
myconfig structure.<br><br>The point is that there is a time period =
between xchg and the first horizontal line during which a reader<br>will =
see the rightmost myconfig structure. <br><br>One possible solution is =
to move xchg behind the first horizontal line, assuming that I =
understand correctly.<br></blockquote><br>Yes, it would in some sense be =
more accurate to run that horizontal line<br>right through the "mcp =3D =
xchg(&amp;curconfig, mcp);".<br><br>But can you do that so that the =
diagram looks OK and is =
legible?<br></div></div></blockquote><div><br></div><div><p =
style=3D"margin: 0px; font-stretch: normal; font-size: 14px; =
line-height: normal; font-family: &quot;Helvetica Neue&quot;; color: =
rgba(0, 0, 0, 0.85);"><br></p><p style=3D"margin: 0px; font-stretch: =
normal; font-size: 14px; line-height: normal; font-family: =
&quot;Helvetica Neue&quot;; color: rgba(0, 0, 0, 0.85);">I will do my =
best to do it</p><p style=3D"margin: 0px; font-stretch: normal; =
font-size: 14px; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;; color: rgba(0, 0, 0, 0.85);"><br></p><p style=3D"margin: =
0px; font-stretch: normal; font-size: 14px; line-height: normal; =
font-family: &quot;Helvetica Neue&quot;; color: rgba(0, 0, 0, =
0.85);">Thanks,</p><p style=3D"margin: 0px; font-stretch: normal; =
font-size: 14px; line-height: normal; font-family: &quot;Helvetica =
Neue&quot;; color: rgba(0, 0, 0, =
0.85);">Alan</p></div><div><br></div><br><blockquote =
type=3D"cite"><div><div><br><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span><span class=3D"Apple-tab-span" =
style=3D"white-space:pre">	</span>Thanx, Paul<br><br><blockquote =
type=3D"cite"><blockquote type=3D"cite">leftmost myconfig structure, and =
all readers that start after the<br>second horizontal line will see the =
rightmost structure. Between<br>the two lines, that is, during the grace =
period, different readers<br>might see different objects, but as long as =
each reader loads the<br>curconfig pointer only once, each reader will =
see a consistent<br>view of its myconfig structure.<br><br>Does that =
help?<br><br><blockquote type=3D"cite">BTW, the original text says that =
black dotted arrows pointing from an older event to a newer event, =
<br>but there exists two black dotted arrows in the wrong =
direction:<br><br>1.The arrow pointing from synchronize_rcu() to =
left-hand rcu_read_lock()<br>2.The arrow pointing right-hand =
rcu_read_lock() to synchronize_rcu() <br><br>The directions of the two =
arrows above may need to be adjusted. I tried to modify this, but after =
a few hours, I still can=E2=80=99t figure out the =
svg...<br></blockquote><br>The trick is to use an SVG editor. &nbsp;For =
better or for worse, I use<br>inkscape. &nbsp;But easy for me to change, =
so I did, again, with your<br>Reported-by.<br><br>The trick is to flip =
each arrow horizontally and then vertically, which<br>reverses the =
direction without having to test one's manual dexterity,<br>which I lack =
in abundance. &nbsp;;-)<br></blockquote><br><br>Thanks for the tricks, =
will try to use it!<br><br>Thanks,<br>Alan<br><br><blockquote =
type=3D"cite"><br>Thanx, Paul<br><br><blockquote =
type=3D"cite">Thanks,<br>Alan<br><br><blockquote type=3D"cite"><br>Does =
that help, or am I missing the point of your question?<br><br>Thanx, =
Paul<br></blockquote></blockquote></blockquote><br><br></blockquote></div>=
</div></blockquote></div><br></body></html>=

--Apple-Mail=_8D07C09B-03B7-49B9-A9D4-A18D8C12CFC4--
