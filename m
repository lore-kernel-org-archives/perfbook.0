Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0a-001b2d01.pphosted.com ([148.163.156.1]:41618 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726466AbfCSPkJ (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Tue, 19 Mar 2019 11:40:09 -0400
Received: from pps.filterd (m0098410.ppops.net [127.0.0.1])
        by mx0a-001b2d01.pphosted.com (8.16.0.27/8.16.0.27) with SMTP id x2JFYUJZ112620
        for <perfbook@vger.kernel.org>; Tue, 19 Mar 2019 11:40:08 -0400
Received: from e11.ny.us.ibm.com (e11.ny.us.ibm.com [129.33.205.201])
        by mx0a-001b2d01.pphosted.com with ESMTP id 2rb2mm2d55-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Tue, 19 Mar 2019 11:40:08 -0400
Received: from localhost
        by e11.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Tue, 19 Mar 2019 15:40:07 -0000
Date: Tue, 19 Mar 2019 08:40:52 -0700
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] toolsoftrade: Fix code listing 4.22 in Chapter 4
Reply-To: paulmck@linux.ibm.com
References: <20190319145927.29610-1-kaslevs@vmware.com>
 <20190319113305.5eb25a6c@gandalf.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190319113305.5eb25a6c@gandalf.local.home>
Message-Id: <20190319154052.GW4102@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Steven Rostedt <rostedt@goodmis.org>
Cc: Slavomir Kaslev <kaslevs@vmware.com>, perfbook@vger.kernel.org, slavomir.kaslev@gmail.com

On Tue, Mar 19, 2019 at 11:33:05AM -0400, Steven Rostedt wrote:
> On Tue, 19 Mar 2019 16:59:27 +0200
> Slavomir Kaslev <kaslevs@vmware.com> wrote:
> 
> > Code listing 4.22 is broken since the READ_ONCE() macro takes a rvalue and the
> > expression parenthesis are unbalanced. This patch fixes it.
> > 
> > Signed-off-by: Slavomir Kaslev <kaslevs@vmware.com>
> > ---
> >  toolsoftrade/toolsoftrade.tex | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/toolsoftrade/toolsoftrade.tex b/toolsoftrade/toolsoftrade.tex
> > index 41605a33..4e0764d0 100644
> > --- a/toolsoftrade/toolsoftrade.tex
> > +++ b/toolsoftrade/toolsoftrade.tex
> > @@ -2111,7 +2111,7 @@ Listing~\ref{lst:toolsoftrade:Avoiding Danger, 2018 Style}.
> >  \begin{listing}[tbp]
> >  \begin{linelabel}[ln:toolsoftrade:Preventing Load Fusing]
> >  \begin{VerbatimL}[commandchars=\\\{\}]
> > -while (!READ_ONCE((!need_to_stop))
> > +while (!READ_ONCE(need_to_stop))
> 
> But doesn't this change the logic?

It does.

> I'm guessing that the double "!" was wrong too.

And it was.  In converting Listing 4.16 to 4.24 (your listing numbers
may vary), I added the READ_ONCE(), but missed removing the extra "!".
Or I added the READ_ONCE() in the wrong place, your choice.  ;-)

							Thanx, Paul

> -- Steve
> 
> 
> >  	do_something_quickly();
> >  \end{VerbatimL}
> >  \end{linelabel}
> 

