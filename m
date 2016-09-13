Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mx0b-001b2d01.pphosted.com ([148.163.158.5]:32944 "EHLO
 mx0a-001b2d01.pphosted.com" rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org
 with ESMTP id S1751633AbcIMOIo (ORCPT <rfc822;perfbook@vger.kernel.org>);
 Tue, 13 Sep 2016 10:08:44 -0400
Received: from pps.filterd (m0098413.ppops.net [127.0.0.1]) by
 mx0b-001b2d01.pphosted.com (8.16.0.17/8.16.0.17) with SMTP id u8DE8cNO126817
 for <perfbook@vger.kernel.org>; Tue, 13 Sep 2016 10:08:43 -0400
Received: from e35.co.us.ibm.com (e35.co.us.ibm.com [32.97.110.153]) by
 mx0b-001b2d01.pphosted.com with ESMTP id 25eh216yj9-1 (version=TLSv1.2
 cipher=AES256-SHA bits=256 verify=NOT) for <perfbook@vger.kernel.org>; Tue,
 13 Sep 2016 10:08:40 -0400
Received: from localhost by e35.co.us.ibm.com with IBM ESMTP SMTP Gateway:
 Authorized Use Only! Violators will be prosecuted for
 <perfbook@vger.kernel.org> from <paulmck@linux.vnet.ibm.com>; Tue, 13 Sep
 2016 08:08:09 -0600
Date: Tue, 13 Sep 2016 07:08:07 -0700
From: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Subject: Re: [PATCH] Add scripts to check 'verbbox' env usage
Reply-To: paulmck@linux.vnet.ibm.com
References: <9188d6a7-2735-ef7a-68da-bac8bb531cb7@gmail.com>
 <20160912154950.GP3851@linux.vnet.ibm.com>
 <3f7df98d-5c2f-e4eb-73c5-4a2e19eb76ac@gmail.com>
 <20160912232857.GY3851@linux.vnet.ibm.com>
 <137dee05-717a-dc39-1d75-b0c8cc5a0f0a@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <137dee05-717a-dc39-1d75-b0c8cc5a0f0a@gmail.com>
Message-Id: <20160913140807.GG3851@linux.vnet.ibm.com>
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org

On Tue, Sep 13, 2016 at 09:09:36PM +0900, Akira Yokosawa wrote:
> On 2016/09/13 8:28, Paul E. McKenney wrote:
> > On Tue, Sep 13, 2016 at 07:12:34AM +0900, Akira Yokosawa wrote:
> >> On 2016/09/12 08:49:50 -0700, Paul E. McKenney wrote:
> >>> On Tue, Sep 13, 2016 at 12:08:11AM +0900, Akira Yokosawa wrote:
> >>>> >From 177cdd60c2cfe8798547ad260bb821feeb896133 Mon Sep 17 00:00:00 2001
> >>>> From: Akira Yokosawa <akiyks@gmail.com>
> >>>> Date: Mon, 12 Sep 2016 23:39:22 +0900
> >>>> Subject: [PATCH] Add scripts to check 'verbbox' env usage
> >>>>
> >>>> This commit adds scripts to search modification candidates
> >>>> for enclosing "verbbox" environment within "figure" environment.
> >>>>
> >>>> At the top of perfbook directory, the command
> >>>>
> >>>> $ sh utilities/doverbboxcheck.sh
> >>>>
> >>>> will show \begin{figure} statements to be moved ahead of
> >>>> "verbbox" environment.
> >>>>
> >>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> >>>> ---
> >>>>  utilities/doverbboxcheck.sh | 36 +++++++++++++++++++++++++++
> >>>>  utilities/verbboxcheck.pl   | 59 +++++++++++++++++++++++++++++++++++++++++++++
> >>>>  2 files changed, 95 insertions(+)
> >>>>  create mode 100644 utilities/doverbboxcheck.sh
> >>>>  create mode 100644 utilities/verbboxcheck.pl
> >>>>
> >>>> diff --git a/utilities/doverbboxcheck.sh b/utilities/doverbboxcheck.sh
> >>>> new file mode 100644
> >>>> index 0000000..2801bf1
> >>>> --- /dev/null
> >>>> +++ b/utilities/doverbboxcheck.sh
> >>>> @@ -0,0 +1,36 @@
> >>>> +#!/bin/sh
> >>>> +#
> >>>> +# Apply verbboxcheck.pl for all .tex files
> >>>> +#
> >>>> +# This program is free software; you can redistribute it and/or modify
> >>>> +# it under the terms of the GNU General Public License as published by
> >>>> +# the Free Software Foundation; either version 2 of the License, or
> >>>> +# (at your option) any later version.
> >>>> +#
> >>>> +# This program is distributed in the hope that it will be useful,
> >>>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >>>> +# GNU General Public License for more details.
> >>>> +#
> >>>> +# You should have received a copy of the GNU General Public License
> >>>> +# along with this program; if not, you can access it online at
> >>>> +# http://www.gnu.org/licenses/gpl-2.0.html.
> >>>> +#
> >>>> +# Copyright (C) Akira Yokosawa, 2016
> >>>> +#
> >>>> +# Authors: Akira Yokosawa <akiyks@gmain.com>
> >>>> +
> >>>> +# check if companion script exists
> >>>> +if ! test -e utilities/verbboxcheck.pl
> >>>> +then
> >>>> +	echo "utilities/verrboxcheck.pl not found."
> >>>> +	exit 1
> >>>> +fi
> >>>> +texfiles=`find . -name '*.tex' -print`
> >>>> +for i in $texfiles
> >>>> +do
> >>>> +	basename="${i%.tex}"
> >>>> +#	echo $basename
> >>>> +	perl ./utilities/verbboxcheck.pl $basename.tex
> >>>> +done
> >>>> +
> >>>> diff --git a/utilities/verbboxcheck.pl b/utilities/verbboxcheck.pl
> >>>> new file mode 100644
> >>>> index 0000000..976a41f
> >>>> --- /dev/null
> >>>> +++ b/utilities/verbboxcheck.pl
> >>>> @@ -0,0 +1,59 @@
> >>>> +#!/usr/bin/perl
> >>>> +#
> >>>> +# Check usage pattern of "verbbox" environment
> >>>> +#
> >>>> +# This program is free software; you can redistribute it and/or modify
> >>>> +# it under the terms of the GNU General Public License as published by
> >>>> +# the Free Software Foundation; either version 2 of the License, or
> >>>> +# (at your option) any later version.
> >>>> +#
> >>>> +# This program is distributed in the hope that it will be useful,
> >>>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
> >>>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
> >>>> +# GNU General Public License for more details.
> >>>> +#
> >>>> +# You should have received a copy of the GNU General Public License
> >>>> +# along with this program; if not, you can access it online at
> >>>> +# http://www.gnu.org/licenses/gpl-2.0.html.
> >>>> +#
> >>>> +# Copyright (C) Akira Yokosawa, 2016
> >>>> +#
> >>>> +# Authors: Akira Yokosawa <akiyks@gmail.com>
> >>>> +
> >>>> +my $line_now;
> >>>> +my $line_prev;
> >>>> +my $line_prev_prev;
> >>>> +my $in_figure = 0;
> >>>> +my $interval = 0;
> >>>> +my $line_num;
> >>>> +my $fig_line;
> >>>> +my $fig_line_num;
> >>>> +my $infile = $ARGV[0];
> >>>> +
> >>>> +$line_prev_prev = <>;
> >>>> +$line_prev = <>;
> >>>> +$line_now = <>;
> >>>> +$line_num = 3;
> >>>> +
> >>>> +while($line_now) {
> >>>> +    if ($in_figure == 1) {
> >>>
> >>> Doesn't this need to be not-equal rather than equal?  Or is the fact
> >>> that I haven't written perl for 20 years becoming apparent?  ;-)
> >>
> >> Ah, this should have been
> >>
> >> +while($line_now) {
> >> +    if ($in_figure) {
> >>
> >> Also, there remain unnecessary variables I used in a preliminary version.
> >> I'm sending a v2 of the patch. Hope it makes more sense.
> > 
> > OK, please color me confused.  Don't you want to list the occurrences
> > of \theverbbox that are -not- within a figure?
> 
> Well, I intentionally chose the \begin{figure} lines.
> As you can see in the diff of commit 510b6afde7fb ("toyrcu: Enclose
> 'verbbox' within 'figure'"), we need to move the \begin{figure} lines.
> By listing them, we can directly jump to a line to be moved in a
> text editor.
> Doesn't this make sense?
> Maybe I need to rephrase the commit message and comment in the script
> to explain the intention.

You know, I am just going to assume that I am suffering from jet lag.
I pulled v2 of your patch, fixed the whitespace error, and pushed it out.

But if anyone complains about these scripts, I am sending them straight
to you.  ;-)

> By the way, I made a typo in the commit message of 510b6afde7fb.
> 
> The first sentence reads
> 
> > Bare "verbbox" environment just after a section heading causes
> > the "afterheading"-ness of the first paragraph.
> 
> This should have been
> 
> Bare "verbbox" environment just after a section heading causes
> the "afterheading"-ness of the first paragraph to be lost.
> 
> If it isn't too late, can you amend the commit message?

Done and pushed.  But yes, you got lucky.  I have been making changes
on another branch.  ;-)

								Thanx, Paul

>                                          Thanks, Akira
> > 
> > 						Thanx, Paul
> > 
> >>>> +	if ($line_now =~ /\\theverbbox/) {
> >>>> +	    print "$infile:$fig_line_num:$fig_line";
> >>>> +	    $in_figure = 0;
> >>>> +	}
> >>>> +	$interval++;
> >>>> +    }
> >>>> +    if ($line_now =~ /\\begin\{figure\}/) {
> >>>> +	$in_figure = 1;
> >>>> +	$fig_line = $line_now;
> >>>> +	$fig_line_num = $line_num;
> >>>> +    }
> >>>> +    if ($interval > 3) {
> >>>> +	$in_figure = 0;
> >>>> +	$interval = 0;
> >>>> +    }
> >>>> +    $line_prev_prev = $line_prev;
> >>>> +    $line_prev = $line_now;
> >>>> +    $line_now = <>;
> >>>> +    $line_num++;
> >>>> +}
> >>>> -- 
> >>>> 1.9.1
> >>>>
> >>>
> >>>
> >>
> > 
> > 
> 

