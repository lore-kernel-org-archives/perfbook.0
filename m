Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from e35.co.us.ibm.com ([32.97.110.153]:46430 "EHLO
 e35.co.us.ibm.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with ESMTP id
 S1752754AbcDXR4q (ORCPT	<rfc822;perfbook@vger.kernel.org>); Sun, 24 Apr 2016
 13:56:46 -0400
Received: from localhost	by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted	for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;	Sun, 24 Apr
 2016 11:56:45 -0600
Received: from b01cxnp23032.gho.pok.ibm.com (b01cxnp23032.gho.pok.ibm.com
 [9.57.198.27])	by d03dlp03.boulder.ibm.com (Postfix) with ESMTP id
 2F5F319D8040	for <perfbook@vger.kernel.org>; Sun, 24 Apr 2016 11:56:12 -0600
 (MDT)
Received: from d01av01.pok.ibm.com (d01av01.pok.ibm.com [9.56.224.215])	by
 b01cxnp23032.gho.pok.ibm.com (8.14.9/8.14.9/NCO v10.0) with ESMTP id
 u3OHuRUC31522880	for <perfbook@vger.kernel.org>; Sun, 24 Apr 2016 17:56:27
 GMT
Received: from d01av01.pok.ibm.com (localhost [127.0.0.1])	by
 d01av01.pok.ibm.com (8.14.4/8.14.4/NCO v10.0 AVout) with ESMTP id
 u3OHuQmo011471	for <perfbook@vger.kernel.org>; Sun, 24 Apr 2016 13:56:26
 -0400
Date: Sun, 24 Apr 2016 10:57:01 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v3 1/3] qqz: Improve accuracy of cross-links
Message-ID: <20160424175701.GU3756@linux.vnet.ibm.com>
Reply-To: paulmck@linux.vnet.ibm.com
References: <571C1843.1060906@gmail.com> <571C1C8F.9000602@gmail.com>
 <571C42A1.8060201@gmail.com> <571C6CBB.4080101@gmail.com>
 <571CD6E7.4060301@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <571CD6E7.4060301@gmail.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sun, Apr 24, 2016 at 11:23:35PM +0900, Akira Yokosawa wrote:
> On 2016/04/24 15:50, Akira Yokosawa wrote:
> > On 2016/04/24 12:50, Akira Yokosawa wrote:
> >> On 2016/04/24 10:08, Akira Yokosawa wrote:
> >>> >From 6ecb00b37832372d18cdc7ff5eaea9a53eab3cb9 Mon Sep 17 00:00:00 2001
> >>> From: Akira Yokosawa <akiysw@gmail.com>
> >>> Date: Sun, 24 Apr 2016 08:19:20 +0900
> >>> Subject: [PATCH v3 1/3] qqz: Improve accuracy of cross-links
> >>>
> >>> In commit 33b93f8258f5 ("qqz: Cross-link questions and answers"),
> >>> cross-links of quick quizzes and their answers were implemented.
> >>> However it uses the \stepcounter{} command, and direct references
> >>> of 'quickquizctr' counter is not output to the .aux file.
> >>> The symptom is when you click on a hyperlink in the resulting PDF,
> >>> you jump to a random nearby label such as that of Figure, Table,
> >>> or Section, etc. which happens just before the \label{} using
> >>> 'quickquizctr'.
> >>>
> >>> By using \refstepcounter{} instead and using 2 counters
> >>> 'quickquizctr' and 'quickquizctrC' ('C' stands for 'Chapter'),
> >>> each of which is automatically reset at a new chapter and
> >>> a new section respectively, and defining \theHNum at the head
> >>> of qqz.sty, then redefining it within the \QuickQuizAnsers
> >>> command, matching QQ.n.m's and QQA.n.m's are output to the .aux
> >>> file correctly.
> >>>
> >>> By applying this change, resulting hyperlinks become to jump to
> >>> places almost exactly where you'd expect.
> >>>
> >>> This change may have the effect of increasing the required number
> >>> of 'pdflatex' iterations to get a final result. The following
> >>> commit will take care of it.
> >>>
> >>> This commit also updates the copyright notices in the header,
> >>> including the name of Paolo Bonzini who authored the commit
> >>> mentioned above.
> >>>
> >>> Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
> >>
> >> Hi, Paul.
> >>
> >> I noticed there really is a change in the behavior of hyperref's of
> >> Chapters. They used to jump to the top of the pages, but after
> >> this patch is applied, they jump to the bottom of the Chapter titles.
> >> So you need to scroll a little to see the title of the Chapters.
> >>
> >> I think this is a regression caused by this patch.
> >>
> >> If you do think so, please keep from pushing this series out.
> >>
> >> Or the benefit of the patch is big enough compared to the change
> >> of the behavior?
> >>
> >>                                             Regards, Akira
> >>
> > 
> > Hi,
> > 
> > Seems like it is not easy (at least for me) to find out what
> > is wrong in this patch. 
> > 
> > So there are a few options I can think of you might want to do 
> > (assuming you'd like to push the refactoring of runlatex.sh):
> > 
> > 1) Apply the series as a whole, then revert [1/3], and push out.
> > 
> > 2) Me resubmit another patch series which just contains the refactoring.
> > 
> > 3) Apply the series as a whole, and push it as is in the hope
> > of someone familiar with LaTeX and hyperref might appear.
> > 
> > Thoughts?
> > 
> >                                               Regards, Akira
> > 
> 
> Hi, Paul.
> 
> So, you've pushed the whole series.
> And I have to apologize to you for the noise.
> I've just realized that I compared apples and oranges.
> 
> In perfbook.pdf, hyperref of a Chapter jumps to the bottom of its
> title, while in perfbook-1c.pdf, it jumps to the head of the page.
> 
> There was no change in the behavior.

Ah, that would explain the lack of complaints.  Most people reading
the book on a mobile device use perfbook-1c.pdf, so the chapter
links would work nicely for them.

> I'm very glad I can contribute the perfbook project in this manner.
> 
> So far, patches I submitted were mostly cosmetic changes.
> I'm planning to submit something that touches the actual contents, too.
> But don't expect too much.

Cosmetic it might be, but I believe that readers will appreciate it
very much!  Thank you again!

							Thanx, Paul

