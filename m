Return-Path: <paulmckrcu+caf_=paulmck=linux.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:62046 "EHLO
        mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726918AbeLEQfM (ORCPT
        <rfc822;perfbook@vger.kernel.org>); Wed, 5 Dec 2018 11:35:12 -0500
Received: from pps.filterd (m0098416.ppops.net [127.0.0.1])
        by mx0b-001b2d01.pphosted.com (8.16.0.22/8.16.0.22) with SMTP id wB5GYPhJ041811
        for <perfbook@vger.kernel.org>; Wed, 5 Dec 2018 11:35:11 -0500
Received: from e12.ny.us.ibm.com (e12.ny.us.ibm.com [129.33.205.202])
        by mx0b-001b2d01.pphosted.com with ESMTP id 2p6grk64rv-1
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NOT)
        for <perfbook@vger.kernel.org>; Wed, 05 Dec 2018 11:35:10 -0500
Received: from localhost
        by e12.ny.us.ibm.com with IBM ESMTP SMTP Gateway: Authorized Use Only! Violators will be prosecuted
        for <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>;
        Wed, 5 Dec 2018 16:35:09 -0000
Date: Wed, 5 Dec 2018 08:35:06 -0800
From: "Paul E. McKenney" <paulmck@linux.ibm.com>
Subject: Re: [PATCH] count: Include atomic_nehalem.pdf instead of
 atomic_nehalem.png
Reply-To: paulmck@linux.ibm.com
References: <38fa0336-1150-7e92-bc00-b094b959f932@gmail.com>
 <482c35de-949b-9bb1-4d96-dd6972ee3430@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <482c35de-949b-9bb1-4d96-dd6972ee3430@gmail.com>
Message-Id: <20181205163506.GT4170@linux.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Wed, Dec 05, 2018 at 08:56:16PM +0900, Akira Yokosawa wrote:
> On 2018/12/05 20:00, Akira Yokosawa wrote:
> > From 213fcdaabb6daa14c1c6cfc6ff780d023478d59f Mon Sep 17 00:00:00 2001
> > From: Akira Yokosawa <akiyks@gmail.com>
> > Date: Wed, 5 Dec 2018 19:48:32 +0900
> > Subject: [PATCH] count: Include atomic_nehalem.pdf instead of atomic_nehalem.png
> > 
> > Without any suffix specified, \includegraphics{} prefers .png to .pdf
> > by default.
> > 
> > Fixes: 04e270767c34 ("count: Restore 'fig:count:Atomic Increment Scalability on Nehalem'")
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > ---
> > Hi Paul,
> > 
> > This is a "minor fix".  Obviously, I missed to check the restored figure
> > before submitting the previous patch set. ;-)
> 
> Looks like this depends on TeX Live version. .png was included on
> Ubuntu Trusty's TeX Live 2013/Debian.
> 
> On Ubuntu Bionic (TeX Live 2017/Debian), .pdf is included both with and
> without this fix.

Queued and pushed, thank you!!!

And I must have been blind or something...  It shows up in my setup,
but miniaturized.  Fixed now, so all is well!  ;-)

							Thanx, Paul

>         Thanks, Akira
> 
> > 
> >         Thanks, Akira
> > --
> >  count/count.tex | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> > 
> > diff --git a/count/count.tex b/count/count.tex
> > index 6fd54b5..bdbc4cd 100644
> > --- a/count/count.tex
> > +++ b/count/count.tex
> > @@ -248,7 +248,7 @@ accuracies far greater than 50\,\% are almost always necessary.
> >  
> >  \begin{figure}[tb]
> >  \centering
> > -\resizebox{2.5in}{!}{\includegraphics{CodeSamples/count/atomic_nehalem}}
> > +\resizebox{2.5in}{!}{\includegraphics{CodeSamples/count/atomic_nehalem.pdf}}
> >  \caption{Atomic Increment Scalability on Nehalem}
> >  \label{fig:count:Atomic Increment Scalability on Nehalem}
> >  \end{figure}
> > 
> 

