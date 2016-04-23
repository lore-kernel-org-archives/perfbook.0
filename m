Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=nnZ8LLSniiRJYz6ENWcq0Ai7HpJ0mkmJmfDudyD54zo=;
 b=zq4a4Qs4dRTPlIt66rX+VRX+B6pmmAGbAmtJzkSLuJs30hqW8eFkCe8w7Z+6fzjslP
 uS0Fre4Nx9noQ6KN2je6lvUITxfhMXR1jAuQio8A2ix6LH77/9W+bpmCxsCgq8Dajh5i
 MMdr7OkrBEvIiDioH1vQG5qj4s2UwI3VGGCfUsDRJROJSBv8UmXPRS9QNiafjZH7nIsN
 p0eqDVJXjtRhOJx+stD+8RJiQyNcJDFOKL31yV3KSFhiOlKm7gWkbe4pW6ATpcSVEb8M
 Z4XOgnUGSIGUeQtISJWbQMfaFdU6hoKDMgKnJ11oYqN0gvynmzx2haXDjYonEBfJ7kIK
 woNw==
Subject: Re: [PATCH v2 0/3] qqz and runlatex improvements
References: <571B5FBE.6030005@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <571B8D14.4090401@gmail.com>
Date: Sat, 23 Apr 2016 23:56:20 +0900
MIME-Version: 1.0
In-Reply-To: <571B5FBE.6030005@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/04/23 20:42, Akira Yokosawa wrote:
>>From 0a9063f5bfc9a984b505fefe54d347f39e099f58 Mon Sep 17 00:00:00 2001
> From: Akira Yokosawa <akiysw@gmail.com>
> Date: Sat, 23 Apr 2016 20:37:29 +0900
> Subject: [PATCH v2 0/3] qqz and runlatex improvements
> 

Hi, Paul

I should have mentioned that this series is rebased to the current master
431a80df9d6e ("Fix build error on Fedora 23 with texlive").

Regarding to ("[PATCH v2 2/3] Improve behavior of build scripts"), I
want to add some comments in the form of a reply to your previous feedback.
As I refactored the script, please note that in-line comments do not
exactly match the actual patch.

> To see what I am getting at, please add a "\ref{this is a typo}" or a
> reference to any other non-\label string, then type "make".  This is a
> pure error that no number of reruns will fix, but the build script will
> nevertheless crank away multiple times.
> 

I checked several intentional error cases for this patch. However, I'm
sure you are the one who will use the scripts most heavily, you might
find corner cases I'm not aware of. 

> Before, it would run bibtex and stop.  (Which, I freely admit, wasn't
> particularly good behavior either!)
> 
> My question is whether it is possible to make the script let the user
> know why it is re-running latex, so that the user can choose to kill
> it early, if appropriate.  Or, alternatively (and for extra credit!),
> recognize which labels are undefined, and do more passes if they are
> quick-quiz links.

I've not gone so far as to distinguish whether a warning is of a quick-quiz
link or not, but I think current level of output should be quite useful
for most of the cases. Please give it a try.

>> --- 
>> #!/bin/sh
>> # [snip]
>> #
>>
>> if test -z "$1"
>> then
>> 	echo No latex file, aborting.
>> 	exit 1
>> fi
>>
>> basename=`echo $1 | sed -e 's/\.tex$//'`
>>
>> iter=1
>> echo "pdflatex $iter"
>> pdflatex $basename > /dev/null 2>&1 < /dev/null || :
>> if grep -q '! Emergency stop.' $basename.log
>> then
>> 	echo "----- Fatal latex error, see $basename.log for details. -----"
> 
> Please add "exit 1" here.  (Yes, this was a bug in my orignal.  But as
> long as we are here...)
> 

Done.

>> fi
>> if grep -q 'LaTeX Warning: There were undefined references' $basename.log
>> then
>> 	if test -d "$2"
>> 	then
>> 		bibtex $basename || :
>> 	else
>> 		echo "No bibliography directory, skipping bibtex."
>> 	fi
>> fi
>> while grep -q 'LaTeX Warning: There were undefined references' $basename.log
>> do
>> 	if test "$iter" -eq 4
>> 	then
>> 		echo "Iteration limit: $iter passes through pdflatex"
>> 		exit 1
>> 	fi
>> 	iter=`expr $iter + 1`
> 
> This would be one point to add some indication of why we are doing
> another pass through the loop.  Might be as simple as adding "Undefined
> references" to the "echo" below.  Or maybe even show the last symbol
> listed as undefined.
>

Done.

And I made a change so that the giving-up of the iteration is decided
by the result of comparison of recent two logs. When they have identical
warnings, giving-up logic kicks in (note that there are special cases
mentioned in the commit message) and the remaining warning messages will be
displayed. The messages should contain the info of undefined symbols.

>> 	echo "pdflatex $iter"
>> 	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
>> 	if grep -q '! Emergency stop.' $basename.log
>> 	then
>> 		echo "----- Fatal latex error, see $basename.log for details. -----"
>> 		exit 1
>> 	fi
>> done
>> while grep -q 'LaTeX Warning: Label(s) may have changed' $basename.log
>> do
>> 	if test "$iter" -ge 4
>> 	then
>> 		echo "Iteration limit: $iter passes through pdflatex"
>> 		exit 1
>> 	fi
>> 	iter=`expr $iter + 1`
> 
> This would be one point to add some indication of why we are doing
> another pass through the loop.  Might be as simple as adding "Label(s)
> may have changed" to the "echo" below.
> 

Done.

>> 	echo "pdflatex $iter"
>> 	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
>> 	if grep -q '! Emergency stop.' $basename.log
>> 	then
>> 		echo "----- Fatal latex error, see $basename.log for details. -----"
>> 		exit 1
>> 	fi
>> done
>> grep "LaTeX Warning:" $basename.log
>> exit 0
>>
> 
> 

As for the bibtex part moved to Makefile, I made '.bbl' be dependent
on '.aux.' 
'.aux' requires pdflatex to run for the first time, so I separated
'runfirstlatex.sh.' Since '.aux' is always updated by pdflatex, this
means that bibtex is always invoked for a normal 'make.'
If you absolutely want bibtex *not* to run (and you are sure that '.bib'
files are not modified), touch a related '.bbl' file just before a 'make'.
Then 'runfirstlatex.sh' won't be invoked. But I think bibtex itself is
fairly quick, and simply doing 'make' is acceptable. Please give it a try
and let me know how it feels like.

I also made changes in the comment area at the head of each script. I added
my copyright notices there, but not sure if those are what are expected.
Could you please give a look at them, too?

                                                         Thanks, Akira

