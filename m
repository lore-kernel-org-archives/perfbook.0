Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:33870 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S2387854AbeGWNEW (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Mon, 23 Jul 2018 09:04:22 -0400
Received: from pps.filterd (m0098414.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id w6NBwiZt027728
 for <perfbook@vger.kernel.org>; Mon, 23 Jul 2018 08:03:29 -0400
Received: from e15.ny.us.ibm.com (e15.ny.us.ibm.com [129.33.205.205]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 2kdbqgyee1-1 (version=TLSv1.2
 cipher=AES256-GCM-SHA384 bits=256 verify=NOT) for <perfbook@vger.kernel.org>;
 Mon, 23 Jul 2018 08:03:28 -0400
Received: from localhost by e15.ny.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Mon, 23 Jul
 2018 08:03:27 -0400
Date: Mon, 23 Jul 2018 05:03:27 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: Memory barrier pairing question
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAJ2Qj5qej+kBZxpy4cUbKVE3NJAnOSc9FZ5wur_rKVU_rnYhVw@mail.gmail.com>
 <20180723023753.GJ12945@linux.vnet.ibm.com>
 <CAJ2Qj5qCC11ZfE5m1-i1DCegFV=CYm1yP7vDXrjEdPqqxPrF-w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: 
 <CAJ2Qj5qCC11ZfE5m1-i1DCegFV=CYm1yP7vDXrjEdPqqxPrF-w@mail.gmail.com>
Message-Id: <20180723120327.GK12945@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Artem Polyakov <artpol84@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Jul 22, 2018 at 09:52:27PM -0700, Artem Polyakov wrote:
> Thank you, Paul!
> 
> I was wondering why in the following tutorial (section 4.4):
> https://www.cl.cam.ac.uk/~pes20/ppc-supplemental/test7.pdf
> They were putting "if ( r1 == r1)" before "isync" and your explanation
> makes it less confusing.
> 
> What was (and somewhat still) confusing in Power ISA (v2.07) is the
> isync description:
> "Executing an isync instruction ensures that all instructions preceding the
> isync instruction have completed before the isync instruction completes,
> and that no subsequent instructions are initiated until after the isync
> instruction completes."
> The term "completes" I guess was understood by me as "committed", but
> according to your explanation, it only means that the instruction is deep
> enough in the pipeline to ensure it's successful commit in the future. And
> the same is with the phrase "no subsequent instructions are initiated until
> after the isync instruction completes". The term "completion" seems obscure
> to me.

I wasn't around for the early PowerPC days, but I could easily imagine
that the word "committed" was a much better match for the much simpler
CPUs of that day.  Things are a bit more complicated these days.  ;-)

> But you did get my question perfectly precise and thank you once again!

Glad that it helped!

							Thanx, Paul

> вс, 22 июля 2018 г. в 19:37, Paul E. McKenney <paulmck@linux.vnet.ibm.com>:
> 
> > On Sun, Jul 22, 2018 at 06:42:45PM -0700, Artem Polyakov wrote:
> > > Hello,
> > > I have a question about the following scenario (considering POWER arch):
> > >
> > > initial { x = 0; y = 0; }
> > >
> > > thread0 {
> > >     x = 1;
> > >     lwsync;
> > >     y = 1;
> > > }
> > >
> > > thread1 {
> > >     a = y;
> > >     isync;
> > >     b = x;
> > > }
> > >
> > > Because "isync" is not a memory barrier this example doesn't have
> > > read/write barrier pairing. However, if I understand correctly, lwsync
> > will
> > > ensure that "x = 1" will become visible to thread1 before lwsync is done
> > > and before "y = 1" will become visible. So "isync" here can be sort of
> > > control dependency as it ensures that "a = y" will be performed before
> > "b =
> > > x" and even will flush the pipeline according to POWER9 spec.
> > >
> > > Can someone comment on this scenario and tell if I am right or where I am
> > > wrong.
> >
> > I am not a Power hardware architect, but here is my understanding.
> >
> > The isync waits until all the prior instructions "execute", but for
> > a limited definition of "execute".  One way to think of isync is as
> > an instruction that does not allow subsequent instructions to start
> > until it can be proven that execution really will reach the isync
> > instruction.
> >
> > So given a load, how could it be that execution would be prevented
> > from reaching the isync instruction?  One possibility is a SEGV.
> > But once address translation completes successfully, SEGV cannot
> > happen.  So isync doesn't need to wait for the load to return an
> > actual value, but instead only for its execution to reach a point
> > where the hardware knows that a value will eventually be returned.
> >
> > And that is why you need a compare and conditional branch before the
> > isync to ensure that the load has completed.  In that case, the
> > hardware cannot prove that execution will actually reach the isync
> > until the load completes, the compare sets the condition code,
> > and the branch condition is evaluated.  Therefore, anything after
> > the compare-branch-isync series cannot start executing until after
> > the load returns its value.
> >
> > Make sense, or am I missing the point of your question?
> >
> >                                                         Thanx, Paul
> >
> >

