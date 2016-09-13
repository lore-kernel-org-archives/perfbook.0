Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=026FQnHJW5BvxqBI7XZkCVYxpwlmnC53ZOrC8WFvhu4=;
 b=ucawwBOW7koFWIvlTPl0iD5/pQ2GI6WJ3w6uQn2ZRLpVHnIZvtvbuRXe7hKN19pbPM
 e0s/RoQ7dP5MbLt+5+2z+BWpflR29Dc4tSbF1xBfa00rUebB8XGYdIwkiR2+vIneQNle
 PD06ei8SyaNB1R3KcVe8n5vnr8jKllbobC0+HEZdd1mdl9kf53O8y1WeCLsYbNiS+1RZ
 3fabxV47mij/TLoWUqmZ7eYlvGqTQ6TUZnS/XJhaC2RwbVvo0tKZPIAtDETCbz5F/dUj
 UWGxUdXQJgxx0s9q/9s4r0BKzlRxaA/0OhvvkpnXAEHTDJEEKVU06USddHoGrKBp4aec
 Dz9Q==
Subject: Re: [PATCH] Add scripts to check 'verbbox' env usage
References: <9188d6a7-2735-ef7a-68da-bac8bb531cb7@gmail.com>
 <20160912154950.GP3851@linux.vnet.ibm.com>
 <3f7df98d-5c2f-e4eb-73c5-4a2e19eb76ac@gmail.com>
 <20160912232857.GY3851@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <137dee05-717a-dc39-1d75-b0c8cc5a0f0a@gmail.com>
Date: Tue, 13 Sep 2016 21:09:36 +0900
MIME-Version: 1.0
In-Reply-To: <20160912232857.GY3851@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/09/13 8:28, Paul E. McKenney wrote:
> On Tue, Sep 13, 2016 at 07:12:34AM +0900, Akira Yokosawa wrote:
>> On 2016/09/12 08:49:50 -0700, Paul E. McKenney wrote:
>>> On Tue, Sep 13, 2016 at 12:08:11AM +0900, Akira Yokosawa wrote:
>>>> >From 177cdd60c2cfe8798547ad260bb821feeb896133 Mon Sep 17 00:00:00 2001
>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>> Date: Mon, 12 Sep 2016 23:39:22 +0900
>>>> Subject: [PATCH] Add scripts to check 'verbbox' env usage
>>>>
>>>> This commit adds scripts to search modification candidates
>>>> for enclosing "verbbox" environment within "figure" environment.
>>>>
>>>> At the top of perfbook directory, the command
>>>>
>>>> $ sh utilities/doverbboxcheck.sh
>>>>
>>>> will show \begin{figure} statements to be moved ahead of
>>>> "verbbox" environment.
>>>>
>>>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>>>> ---
>>>>  utilities/doverbboxcheck.sh | 36 +++++++++++++++++++++++++++
>>>>  utilities/verbboxcheck.pl   | 59 +++++++++++++++++++++++++++++++++++++++++++++
>>>>  2 files changed, 95 insertions(+)
>>>>  create mode 100644 utilities/doverbboxcheck.sh
>>>>  create mode 100644 utilities/verbboxcheck.pl
>>>>
>>>> diff --git a/utilities/doverbboxcheck.sh b/utilities/doverbboxcheck.sh
>>>> new file mode 100644
>>>> index 0000000..2801bf1
>>>> --- /dev/null
>>>> +++ b/utilities/doverbboxcheck.sh
>>>> @@ -0,0 +1,36 @@
>>>> +#!/bin/sh
>>>> +#
>>>> +# Apply verbboxcheck.pl for all .tex files
>>>> +#
>>>> +# This program is free software; you can redistribute it and/or modify
>>>> +# it under the terms of the GNU General Public License as published by
>>>> +# the Free Software Foundation; either version 2 of the License, or
>>>> +# (at your option) any later version.
>>>> +#
>>>> +# This program is distributed in the hope that it will be useful,
>>>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>> +# GNU General Public License for more details.
>>>> +#
>>>> +# You should have received a copy of the GNU General Public License
>>>> +# along with this program; if not, you can access it online at
>>>> +# http://www.gnu.org/licenses/gpl-2.0.html.
>>>> +#
>>>> +# Copyright (C) Akira Yokosawa, 2016
>>>> +#
>>>> +# Authors: Akira Yokosawa <akiyks@gmain.com>
>>>> +
>>>> +# check if companion script exists
>>>> +if ! test -e utilities/verbboxcheck.pl
>>>> +then
>>>> +	echo "utilities/verrboxcheck.pl not found."
>>>> +	exit 1
>>>> +fi
>>>> +texfiles=`find . -name '*.tex' -print`
>>>> +for i in $texfiles
>>>> +do
>>>> +	basename="${i%.tex}"
>>>> +#	echo $basename
>>>> +	perl ./utilities/verbboxcheck.pl $basename.tex
>>>> +done
>>>> +
>>>> diff --git a/utilities/verbboxcheck.pl b/utilities/verbboxcheck.pl
>>>> new file mode 100644
>>>> index 0000000..976a41f
>>>> --- /dev/null
>>>> +++ b/utilities/verbboxcheck.pl
>>>> @@ -0,0 +1,59 @@
>>>> +#!/usr/bin/perl
>>>> +#
>>>> +# Check usage pattern of "verbbox" environment
>>>> +#
>>>> +# This program is free software; you can redistribute it and/or modify
>>>> +# it under the terms of the GNU General Public License as published by
>>>> +# the Free Software Foundation; either version 2 of the License, or
>>>> +# (at your option) any later version.
>>>> +#
>>>> +# This program is distributed in the hope that it will be useful,
>>>> +# but WITHOUT ANY WARRANTY; without even the implied warranty of
>>>> +# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
>>>> +# GNU General Public License for more details.
>>>> +#
>>>> +# You should have received a copy of the GNU General Public License
>>>> +# along with this program; if not, you can access it online at
>>>> +# http://www.gnu.org/licenses/gpl-2.0.html.
>>>> +#
>>>> +# Copyright (C) Akira Yokosawa, 2016
>>>> +#
>>>> +# Authors: Akira Yokosawa <akiyks@gmail.com>
>>>> +
>>>> +my $line_now;
>>>> +my $line_prev;
>>>> +my $line_prev_prev;
>>>> +my $in_figure = 0;
>>>> +my $interval = 0;
>>>> +my $line_num;
>>>> +my $fig_line;
>>>> +my $fig_line_num;
>>>> +my $infile = $ARGV[0];
>>>> +
>>>> +$line_prev_prev = <>;
>>>> +$line_prev = <>;
>>>> +$line_now = <>;
>>>> +$line_num = 3;
>>>> +
>>>> +while($line_now) {
>>>> +    if ($in_figure == 1) {
>>>
>>> Doesn't this need to be not-equal rather than equal?  Or is the fact
>>> that I haven't written perl for 20 years becoming apparent?  ;-)
>>
>> Ah, this should have been
>>
>> +while($line_now) {
>> +    if ($in_figure) {
>>
>> Also, there remain unnecessary variables I used in a preliminary version.
>> I'm sending a v2 of the patch. Hope it makes more sense.
> 
> OK, please color me confused.  Don't you want to list the occurrences
> of \theverbbox that are -not- within a figure?

Well, I intentionally chose the \begin{figure} lines.
As you can see in the diff of commit 510b6afde7fb ("toyrcu: Enclose
'verbbox' within 'figure'"), we need to move the \begin{figure} lines.
By listing them, we can directly jump to a line to be moved in a
text editor.
Doesn't this make sense?
Maybe I need to rephrase the commit message and comment in the script
to explain the intention.

By the way, I made a typo in the commit message of 510b6afde7fb.

The first sentence reads

> Bare "verbbox" environment just after a section heading causes
> the "afterheading"-ness of the first paragraph.

This should have been

Bare "verbbox" environment just after a section heading causes
the "afterheading"-ness of the first paragraph to be lost.

If it isn't too late, can you amend the commit message?

                                         Thanks, Akira
> 
> 						Thanx, Paul
> 
>>>> +	if ($line_now =~ /\\theverbbox/) {
>>>> +	    print "$infile:$fig_line_num:$fig_line";
>>>> +	    $in_figure = 0;
>>>> +	}
>>>> +	$interval++;
>>>> +    }
>>>> +    if ($line_now =~ /\\begin\{figure\}/) {
>>>> +	$in_figure = 1;
>>>> +	$fig_line = $line_now;
>>>> +	$fig_line_num = $line_num;
>>>> +    }
>>>> +    if ($interval > 3) {
>>>> +	$in_figure = 0;
>>>> +	$interval = 0;
>>>> +    }
>>>> +    $line_prev_prev = $line_prev;
>>>> +    $line_prev = $line_now;
>>>> +    $line_now = <>;
>>>> +    $line_num++;
>>>> +}
>>>> -- 
>>>> 1.9.1
>>>>
>>>
>>>
>>
> 
> 

