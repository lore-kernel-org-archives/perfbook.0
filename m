Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e35.co.us.ibm.com ([32.97.110.153]:40849 "EHLO
 e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1751508AbbEJUtv (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 10 May 2015
 16:49:51 -0400
Received: from /spool/local	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 10 May
 2015 14:49:50 -0600
Received: from b03cxnp07028.gho.boulder.ibm.com
 (b03cxnp07028.gho.boulder.ibm.com [9.17.130.15])	by d03dlp02.boulder.ibm.com
 (Postfix) with ESMTP id 7B81A3E4003B	for <perfbook@vger.kernel.org>; Sun, 10
 May 2015 14:49:48 -0600 (MDT)
Received: from d03av05.boulder.ibm.com (d03av05.boulder.ibm.com [9.17.195.85])
 by b03cxnp07028.gho.boulder.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 t4AKlikq17235988	for <perfbook@vger.kernel.org>; Sun, 10 May 2015 13:47:44
 -0700
Received: from d03av05.boulder.ibm.com (localhost [127.0.0.1])	by
 d03av05.boulder.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 t4AKnmCX021779	for <perfbook@vger.kernel.org>; Sun, 10 May 2015 14:49:48
 -0600
Date: Sun, 10 May 2015 13:49:47 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: About Figure 6.5 Chapter 6 (v 31.01.2015)
Message-ID: <20150510204947.GD6776@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: 
 <CAOTdtQztEd=AqfA0jFmvGvVvVmuF9qv66LtgSF85AYB95SreUA@mail.gmail.com>
 <CAOTdtQy3tyBm1uzQgfhacGrNc78VwVHVvc_W=er83Cr_CW+=cw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: 
 <CAOTdtQy3tyBm1uzQgfhacGrNc78VwVHVvc_W=er83Cr_CW+=cw@mail.gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Jose Fernando Santos de Carvalho <jfsc@cin.ufpe.br>
Cc: perfbook@vger.kernel.org

On Sat, May 09, 2015 at 12:01:01PM -0300, Jose Fernando Santos de Carvalho wrote:
> Link: http://ustore1.rnp.br/ustore/faces/publicFile.xhtml?code=35e4c269403136c4a9fdb9227b704409
> 
> On Tue, May 5, 2015 at 11:40 PM, Jose Fernando Santos de Carvalho
> <jfsc@cin.ufpe.br> wrote:
> > Dear all,
> >
> > while writing chapter 6 (Partitioning and Synchronisation Design), Paul has
> > presented five special cases about Left - and Right-Hand Locks(Figure 6.5).
> > However, it is not clear for me the possible problem in the fourth case
> > (link).
> >
> >
> > If possible, could anyone send some feedback about it?
> >
> > Link:
> > http://ustore1.rnp.br/ustore/faces/publicFile.xhtml?code=35e4c269403136c4a9fdb9227b704409--
> >
> > --
> > Jose Fernando

Hello, Jose,

You could indeed claim that the second-to-last row is safe because the two
ends will be operating on different pointers for element 1.  Nevertheless,
the fact remains that both ends need to operate on element 1 simultaneously,
which should give us pause.  Especially given that we are in a concurrent
environment.

For example, suppose that thread A holds the left-hand lock and wants to
remove element 0.  While thread A is comtemplating doing this, some other
thread B might hold the right-hand lock and remove element 2.  We are now
in the state shown in the third row, and thus completely unsafe.

							Thanx, Paul

