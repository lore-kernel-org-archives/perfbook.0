Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=SEMTXaOaQPjgYNsdBkMfao4hvqRsQAQ1hMqF0I91krw=;
 b=wNiG8P/t0hmtD5BkzGE8CzjYIh6uGi1cEer8WmOUIAS20iNKexP3U1asw1p5HYenj+
 4qxnaihP0P/fesDtIeS5bWMdNmblOdIuwCQKCglgmEZmsZdqZcQnVliWWvIcs96JDPDN
 OFgPMQz1OtyeU2C+aNWcoUNMx3pfqhqKsQylD1AKkbHs8sEt5iAJCp6P3HBVVCr9RmlB
 f1p6Sc3hAghH/uJTipQ2VtT719cfsd6viEcZ/ki9sIufq+AdC55EYDtF93FslkPEsaE8
 UBOSHpmlP8oT66KUpNZbXp2SxJFaGvoN8/mTcdEdy8XEQPwZgpwQRiPpNUypYvUcpSZv
 e26w==
MIME-Version: 1.0
In-Reply-To: <21ba5bee-18ed-4f4d-1d1f-7eb4bdbe3f8e@gmail.com>
References: <20160921024448.24744-1-sj38.park@gmail.com>
 <20160921024448.24744-10-sj38.park@gmail.com>
 <21ba5bee-18ed-4f4d-1d1f-7eb4bdbe3f8e@gmail.com>
From: SeongJae Park <sj38.park@gmail.com>
Date: Wed, 21 Sep 2016 21:59:31 +0900
Message-ID: 
 <CAEjAshq0mtEeqefxyS5mvgbJB5iW9sD6Z2cNTc7X3W7jfT2nRg@mail.gmail.com>
Subject: Re: [PATCH 09/17] formal/dyntickrcu: Fix typos
Content-Type: multipart/alternative; boundary=001a114d6d6686b566053d041f8b
To: Akira Yokosawa <akiyks@gmail.com>
Cc: Paul McKenney <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

--001a114d6d6686b566053d041f8b
Content-Type: text/plain; charset=UTF-8

Hi,


Thanks for all your comments and agree!  Will send next patches as reply to
this mail soon.


Thanks,
SeongJae Park

On Wed, Sep 21, 2016 at 7:57 PM, Akira Yokosawa <akiyks@gmail.com> wrote:

> Hi,
>
> I have a few comments regarding this patch.
>
> On 2016/09/21 11:44:40 +0900, SeongJae Park wrote:
> > Signed-off-by: SeongJae Park <sj38.park@gmail.com>
> > ---
> >  formal/dyntickrcu.tex | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> >
> > diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
> > index 5ede587..1d3e155 100644
> > --- a/formal/dyntickrcu.tex
> > +++ b/formal/dyntickrcu.tex
> > @@ -213,7 +213,7 @@ Line~3 fetches the current CPU's number, while
> lines~5 and~6
> >  increment the \co{rcu_update_flag} nesting counter if it
> >  is already non-zero.
> >  Lines~7-9 check to see whether we are the outermost level of
> > -interrupt, and, if so, whether \co{dynticks_progress_counter}
> > +interrupt, and, if so, \co{dynticks_progress_counter}
> >  needs to be incremented.
> >  If so, line~10 increments \co{dynticks_progress_counter},
> >  line~11 executes a memory barrier, and line~12 increments
>
> I think this change is unnecessary.  The original sentence makes
> sense for me.
>
> > @@ -887,9 +887,9 @@ is even.
> >  Upon failure, \co{spin} writes out a
> >  ``trail'' file
> >  (\path{dyntickRCU-base-sl-busted.spin.trail})
> > -file, which records the sequence of states that lead to the failure.
> > +, which records the sequence of states that lead to the failure.
> >  Use the {\tt spin -t -p -g -l dyntickRCU-base-sl-busted.spin}
> > -command to cause \co{spin} to retrace this sequence of state,
> > +command to cause \co{spin} to retrace this sequence of states,
> >  printing the statements executed and the values of variables
> >  (\path{dyntickRCU-base-sl-busted.spin.trail.txt}).
> >  Note that the line numbers do not match the listing above due to
> >
>
> Well, if you put the "," at the beginning of the line, there would be
> an extra space (or even a line break) between the ")" and the ",".
> A better hunk would be as the following;
>
> > @@ -886,10 +886,10 @@ results in failure, as line~23 is checking that
> the wrong
> >  is even.
> >  Upon failure, \co{spin} writes out a
> >  ``trail'' file
> > -(\path{dyntickRCU-base-sl-busted.spin.trail})
> > -file, which records the sequence of states that lead to the failure.
> > +(\path{dyntickRCU-base-sl-busted.spin.trail}),
> > +which records the sequence of states that lead to the failure.
> >  Use the {\tt spin -t -p -g -l dyntickRCU-base-sl-busted.spin}
> > -command to cause \co{spin} to retrace this sequence of state,
> > +command to cause \co{spin} to retrace this sequence of states,
> >  printing the statements executed and the values of variables
> >  (\path{dyntickRCU-base-sl-busted.spin.trail.txt}).
> >  Note that the line numbers do not match the listing above due to
>
>                                                   Thanks, Akira
>

--001a114d6d6686b566053d041f8b
Content-Type: text/html; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

<div dir=3D"ltr"><div class=3D"gmail_default" style=3D"font-family:arial,he=
lvetica,sans-serif">Hi,</div><div class=3D"gmail_default" style=3D"font-fam=
ily:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" styl=
e=3D"font-family:arial,helvetica,sans-serif"><br></div><div class=3D"gmail_=
default" style=3D"font-family:arial,helvetica,sans-serif">Thanks for all yo=
ur comments and agree!=C2=A0 Will send next patches as reply to this mail s=
oon.</div><div class=3D"gmail_default" style=3D"font-family:arial,helvetica=
,sans-serif"><br></div><div class=3D"gmail_default" style=3D"font-family:ar=
ial,helvetica,sans-serif"><br></div><div class=3D"gmail_default" style=3D"f=
ont-family:arial,helvetica,sans-serif">Thanks,</div><div class=3D"gmail_def=
ault" style=3D"font-family:arial,helvetica,sans-serif">SeongJae Park</div><=
div class=3D"gmail_default" style=3D"font-family:arial,helvetica,sans-serif=
"><br></div><div class=3D"gmail_extra"><div class=3D"gmail_quote">On Wed, S=
ep 21, 2016 at 7:57 PM, Akira Yokosawa <span dir=3D"ltr">&lt;<a href=3D"mai=
lto:akiyks@gmail.com" target=3D"_blank">akiyks@gmail.com</a>&gt;</span> wro=
te:<br><blockquote class=3D"gmail_quote" style=3D"margin:0 0 0 .8ex;border-=
left:1px #ccc solid;padding-left:1ex">Hi,<br>
<br>
I have a few comments regarding this patch.<br>
<span class=3D""><br>
On 2016/09/21 11:44:40 +0900, SeongJae Park wrote:<br>
&gt; Signed-off-by: SeongJae Park &lt;<a href=3D"mailto:sj38.park@gmail.com=
">sj38.park@gmail.com</a>&gt;<br>
&gt; ---<br>
&gt;=C2=A0 formal/dyntickrcu.tex | 6 +++---<br>
&gt;=C2=A0 1 file changed, 3 insertions(+), 3 deletions(-)<br>
&gt;<br>
&gt; diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex<br>
&gt; index 5ede587..1d3e155 100644<br>
&gt; --- a/formal/dyntickrcu.tex<br>
&gt; +++ b/formal/dyntickrcu.tex<br>
&gt; @@ -213,7 +213,7 @@ Line~3 fetches the current CPU&#39;s number, while=
 lines~5 and~6<br>
&gt;=C2=A0 increment the \co{rcu_update_flag} nesting counter if it<br>
&gt;=C2=A0 is already non-zero.<br>
&gt;=C2=A0 Lines~7-9 check to see whether we are the outermost level of<br>
&gt; -interrupt, and, if so, whether \co{dynticks_progress_counter}<br>
&gt; +interrupt, and, if so, \co{dynticks_progress_counter}<br>
&gt;=C2=A0 needs to be incremented.<br>
&gt;=C2=A0 If so, line~10 increments \co{dynticks_progress_counter}<wbr>,<b=
r>
&gt;=C2=A0 line~11 executes a memory barrier, and line~12 increments<br>
<br>
</span>I think this change is unnecessary.=C2=A0 The original sentence make=
s<br>
sense for me.<br>
<span class=3D""><br>
&gt; @@ -887,9 +887,9 @@ is even.<br>
&gt;=C2=A0 Upon failure, \co{spin} writes out a<br>
&gt;=C2=A0 ``trail&#39;&#39; file<br>
&gt;=C2=A0 (\path{dyntickRCU-base-sl-<wbr>busted.spin.trail})<br>
&gt; -file, which records the sequence of states that lead to the failure.<=
br>
&gt; +, which records the sequence of states that lead to the failure.<br>
&gt;=C2=A0 Use the {\tt spin -t -p -g -l dyntickRCU-base-sl-busted.<wbr>spi=
n}<br>
&gt; -command to cause \co{spin} to retrace this sequence of state,<br>
&gt; +command to cause \co{spin} to retrace this sequence of states,<br>
&gt;=C2=A0 printing the statements executed and the values of variables<br>
&gt;=C2=A0 (\path{dyntickRCU-base-sl-<wbr>busted.spin.trail.txt}).<br>
&gt;=C2=A0 Note that the line numbers do not match the listing above due to=
<br>
&gt;<br>
<br>
</span>Well, if you put the &quot;,&quot; at the beginning of the line, the=
re would be<br>
an extra space (or even a line break) between the &quot;)&quot; and the &qu=
ot;,&quot;.<br>
A better hunk would be as the following;<br>
<br>
&gt; @@ -886,10 +886,10 @@ results in failure, as line~23 is checking that =
the wrong<br>
<span class=3D"">&gt;=C2=A0 is even.<br>
&gt;=C2=A0 Upon failure, \co{spin} writes out a<br>
&gt;=C2=A0 ``trail&#39;&#39; file<br>
</span>&gt; -(\path{dyntickRCU-base-sl-<wbr>busted.spin.trail})<br>
<span class=3D"">&gt; -file, which records the sequence of states that lead=
 to the failure.<br>
</span>&gt; +(\path{dyntickRCU-base-sl-<wbr>busted.spin.trail}),<br>
&gt; +which records the sequence of states that lead to the failure.<br>
<span class=3D"">&gt;=C2=A0 Use the {\tt spin -t -p -g -l dyntickRCU-base-s=
l-busted.<wbr>spin}<br>
&gt; -command to cause \co{spin} to retrace this sequence of state,<br>
&gt; +command to cause \co{spin} to retrace this sequence of states,<br>
&gt;=C2=A0 printing the statements executed and the values of variables<br>
&gt;=C2=A0 (\path{dyntickRCU-base-sl-<wbr>busted.spin.trail.txt}).<br>
&gt;=C2=A0 Note that the line numbers do not match the listing above due to=
<br>
<br>
</span>=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=
=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 =
=C2=A0 =C2=A0 =C2=A0 =C2=A0 =C2=A0 Thanks, Akira<br>
</blockquote></div><br></div></div>

--001a114d6d6686b566053d041f8b--

