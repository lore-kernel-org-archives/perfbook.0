Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:35455 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1750705AbdAWA6J (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Sun, 22 Jan 2017 19:58:09 -0500
Received: from pps.filterd (m0098421.ppops.net [127.0.0.1]) by
 mx0a-001b2d01.pphosted.com (8.16.0.20/8.16.0.20) with SMTP id v0N0rY4D099612
 for <perfbook@vger.kernel.org>; Sun, 22 Jan 2017 19:58:09 -0500
Received: from e36.co.us.ibm.com (e36.co.us.ibm.com [32.97.110.154]) by
 mx0a-001b2d01.pphosted.com with ESMTP id 28520wh3n5-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Sun,
 22 Jan 2017 19:58:08 -0500
Received: from localhost by e36.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Sun, 22 Jan
 2017 17:58:04 -0700
Date: Sun, 22 Jan 2017 16:58:01 -0800
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH v2] autodate.sh: Use printf command instead of echo
Reply-To: paulmck@linux.vnet.ibm.com
References: <20170116234125.28692-1-twoerner@gmail.com>
 <d63ae83f-f918-73df-14f1-a7eb01f99e66@gmail.com>
 <898ffe7c-cc25-773d-28a1-ff9c7f9c97e0@gmail.com>
 <20170119023317.GA15981@linux-uys3>
 <5611d557-8d79-e767-3b1e-085c7aceb0c3@gmail.com>
 <966495e1-22c2-9573-e49c-c08663b3437f@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <966495e1-22c2-9573-e49c-c08663b3437f@gmail.com>
Message-Id: <20170123005800.GA28085@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Sat, Jan 21, 2017 at 12:01:59AM +0900, Akira Yokosawa wrote:
> On 2017/01/19 20:16, Akira Yokosawa wrote:
> >>From b981648ff25387ecea68b55350671c55ad894884 Mon Sep 17 00:00:00 2001
> > From: Akira Yokosawa <akiyks@gmail.com>
> > Date: Tue, 17 Jan 2017 20:04:54 +0900
> > Subject: [PATCH v2] autodate.sh: Use printf command instead of echo
> > 
> > Using "echo" command to generate output containing "\" characters
> > caused a build error depending on the variant of "sh".
> > For portability, we should use "printf" via "env" command.
> > 
> > Fixes: 878bf8160a5c ("Make date of git commit be reflected automatically")
> > Reported-by: Trevor Woerner <twoerner@gmail.com>
> > Tested-by: Trevor Woerner <twoerner@gmail.com>
> > Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> > ---
> > v2: Changes in commit log
> >       o Tested-by from Trevor
> >       o Title of fixed commit
> 
> Well, seems like I should have put the "Tested-by:" from Trevor
> below my "Signed-off-by:" to respect the chain of event.
> If it is not too late, can you reorder them for me?

You got lucky, internet-access troubles.  ;-)

Queued and pushed with the Tested-by and Signed-off-by reversed.

							Thanx, Paul

>                                       Thanks, Akira                     
> 
> > 
> >  utilities/autodate.sh | 6 +++---
> >  1 file changed, 3 insertions(+), 3 deletions(-)
> > 
> > diff --git a/utilities/autodate.sh b/utilities/autodate.sh
> > index 6df8f99..a56bc70 100644
> > --- a/utilities/autodate.sh
> > +++ b/utilities/autodate.sh
> > @@ -35,7 +35,7 @@ else
> >  	gitstatus=`git status --porcelain | wc -l`
> >  	if [ $gitstatus != "0" ]
> >  	then
> > -		modified=" (m)"
> > +		modified="(m)"
> >  	else
> >  		modified=""
> >  	fi
> > @@ -44,5 +44,5 @@ month=`date --date="$date_str" +%B`
> >  year=`date --date="$date_str" +%Y`
> >  day=`date --date="$date_str" +%e`
> >  
> > -echo "\\date{$month $day, $year$modified}"
> > -echo "\\\newcommand{\\\commityear}{$year}"
> > +env printf "\\date{%s %s, %s %s}\n" $month $day $year $modified
> > +env printf "\\\newcommand{\\\commityear}{%s}\n" $year
> > 
> 

