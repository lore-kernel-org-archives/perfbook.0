Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=AH4FIKxNRwKSmpsAFXK/2jFU6Gi28jabo9nwUtWEL5k=;
 b=jw6UsEPoGh/FkD5hj9ruZ4wHHqRda7MYGqkzZVhjmYYUh144Zt/P2MovYZI10VV1zc
 KCKqHzMe1Q2MtpIiADSGlwj+xkBJO/8qxCP5FO19lYVBquqmMxzho5WgNdZ2uiyFmlvn
 OcQpnnEtdYhSp5ROo/gArpNWimdiyOIMDHO4dMgJSIap8ahCAkGMQvembrz4W7Wb9Q03
 Y7POsO0++yIk+NgY4YiRFkthCLeBqnTSi3VOgesbf8ZXOlaaltaX5m5D36RU2lGenodp
 1NSf6WIc67jQTOYakFpUvaN9rR7ztMtlueAUWgU4IKanx1cBJ57OS4HU95KlisEmMd+F
 w6cQ==
Subject: Re: [PATCH 2/2] runlatex.sh: Fix while loop condition
References: <5718E390.1090309@gmail.com> <5718E478.3000406@gmail.com>
 <20160421162741.GB3879@linux.vnet.ibm.com> <57194E98.1040001@gmail.com>
 <20160421235400.GI3879@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <571A1FF0.2080602@gmail.com>
Date: Fri, 22 Apr 2016 21:58:24 +0900
MIME-Version: 1.0
In-Reply-To: <20160421235400.GI3879@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2016/04/22 16:54 -0700, Paul E. McKenney wrote:
[snip]

>> Can you try this one?
>> Thanks, Akira
> 
> I did, though for some reason I had to hand-apply it on my test branch.
> Not sure what "git apply" didn't like.

Well, I'm afraid you tried to apply it after [PATCH 2/2] applied.
I should have made it clear it was a diff from master at that moment.
Sorry for your trouble.

> It does repeat upon undefined, which is good.  Nicer behavior after
> bibliography changes!
> 
> There is another "Fatal latex error" earlier that I missed, and it would
> be good to have an "exit 1" on that one as well.
> 
> The one thing I am still concerned about is a real undefined reference,
> which would consume a full five iterations.  Not really sure what would
> be improved behavior, though.  Thoughts?
> 
> 							Thanx, Paul

So your question is why you need to change the maximum value from 4 to 5,
isn't it?  That's because the count is checked at the end of the loop,
and even when the 4th round of pdflatex is successful, the check will
fire and 'make' will regard it as an error. At such a later stage, 
remaining warning should only be 'LaTeX Warning: Label(s) may have changed',
if any.

So I made a fairly invasive modification to the script so that the count
is checked at the beginning of the loop. Also the loop is separated for each
of the warning message.

Appended is the whole source code of the script (without the comment part at
the head). I'm not sure which point should I make a diff from. Note that
I truncated the warning messages given to grep. They should be long enough.

What do you think?

If it is OK, I'll resubmit the V2 of the patch series relative to the
current master.

                                                       Thanks, Akira.

--- 
#!/bin/sh
# [snip]
#

if test -z "$1"
then
	echo No latex file, aborting.
	exit 1
fi

basename=`echo $1 | sed -e 's/\.tex$//'`

iter=1
echo "pdflatex $iter"
pdflatex $basename > /dev/null 2>&1 < /dev/null || :
if grep -q '! Emergency stop.' $basename.log
then
	echo "----- Fatal latex error, see $basename.log for details. -----"
fi
if grep -q 'LaTeX Warning: There were undefined references' $basename.log
then
	if test -d "$2"
	then
		bibtex $basename || :
	else
		echo "No bibliography directory, skipping bibtex."
	fi
fi
while grep -q 'LaTeX Warning: There were undefined references' $basename.log
do
	if test "$iter" -eq 4
	then
		echo "Iteration limit: $iter passes through pdflatex"
		exit 1
	fi
	iter=`expr $iter + 1`
	echo "pdflatex $iter"
	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
	if grep -q '! Emergency stop.' $basename.log
	then
		echo "----- Fatal latex error, see $basename.log for details. -----"
		exit 1
	fi
done
while grep -q 'LaTeX Warning: Label(s) may have changed' $basename.log
do
	if test "$iter" -ge 4
	then
		echo "Iteration limit: $iter passes through pdflatex"
		exit 1
	fi
	iter=`expr $iter + 1`
	echo "pdflatex $iter"
	pdflatex $basename > /dev/null 2>&1 < /dev/null || :
	if grep -q '! Emergency stop.' $basename.log
	then
		echo "----- Fatal latex error, see $basename.log for details. -----"
		exit 1
	fi
done
grep "LaTeX Warning:" $basename.log
exit 0

