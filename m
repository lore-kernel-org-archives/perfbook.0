Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:33420 "EHLO
 mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org	with
 ESMTP id S1751604AbcDUWFO (ORCPT	<rfc822;perfbook@vger.kernel.org>); Thu, 21
 Apr 2016 18:05:14 -0400
Received: by mail-pf0-f194.google.com with SMTP id e190so8077914pfe.0 for
 <perfbook@vger.kernel.org>; Thu, 21 Apr 2016 15:05:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=jdDc35ugq1sOw+pQQz4D85OoPPKDuIj5tdIL2gQMPnk=;
 b=mQznqLIo88JpcVhz2MdV1+CMZ05dwR1WExZC3uf95zOp4F6194zaztW+O+3/nfcbX6
 g+6QaejGhkEs7Mj5sAKQh22Bl2PI92X9haSVZuDeV75Yw3ZgqkgFQmclewY2x9jcn50H
 6TqGttARO475D7Y6UEW4i+h59Z9HqBe0y+m5g7t+DAbgDBU6A2R7v709M4K8XXZd7cgu
 2Hr4swI1r26PpzqdsY4JrJ9wZcRmGKIl0X/rECJFfXfH2mTqkeRVVOIGJMTCQyvDjLK3
 EDV2lgaeQZ43oKHnxInrKfkptqeIEfYUVxQHI1/Z4DM/KUo93Xh8KGHXRVoP7YSvCAoT
 w5xg==
Subject: Re: [PATCH 2/2] runlatex.sh: Fix while loop condition
References: <5718E390.1090309@gmail.com> <5718E478.3000406@gmail.com>
 <20160421162741.GB3879@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <57194E98.1040001@gmail.com>
Date: Fri, 22 Apr 2016 07:05:12 +0900
MIME-Version: 1.0
In-Reply-To: <20160421162741.GB3879@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>

Hi Paul,

On 2016/04/22 1:27, Paul E. McKenney wrote:
> On Thu, Apr 21, 2016 at 11:32:24PM +0900, Akira Yokosawa wrote:
>> >From a5cb77713f4720592f75db71394fcad784ca480e Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiysw@gmail.com>
>> Date: Thu, 21 Apr 2016 22:11:06 +0900
>> Subject: [PATCH 2/2] runlatex.sh: Fix while loop condition
>>
>> After commit 33b93f8258f5 ("qqz: Cross-link questions and answers"),
>> 'make' becomes to terminate prematurely with warning messages such as
>>
>>>   Latex Warning: There were undefined references
>>>   Latex Warning: There were multiply-defined labels.
>>
>> This can be dealt with loosening loop condition in runlatex.sh
>> which is given to 'grep' command.
>> Also, This commit increases the iteration max count to accommodate
>> the required number of 'pdflatex' invocations caused by qqz cross-link.
>>
>> Signed-off-by: Akira Yokosawa <akiysw@gmail.com>
> 
> I pulled this into a test branch, and it seemed to work for me, thank you!
> I am running on Ubuntu, any experience on other platforms?
> 
> Please see below for a couple of questions.
> 
> 							Thanx, Paul
> 
>> ---
>>  utilities/runlatex.sh | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
>> index 8d2d77a..15d96c1 100644
>> --- a/utilities/runlatex.sh
>> +++ b/utilities/runlatex.sh
>> @@ -47,7 +47,7 @@ then
>>  		echo "No bibliography directory, skipping bibtex."
>>  	fi
>>  fi
>> -while grep -q 'LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.' $basename.log
>> +while grep -q 'LaTeX Warning:' $basename.log
>>  do
>>  	iter=`expr $iter + 1`
>>  	echo "pdflatex $iter"
> 
> Given the loosening above, should we put a "grep LaTeX Warning:" here,
> so that users could interrupt the build if they felt that rerunning
> latex wasn't going to help?

So, I loosened the condition too much. I tried another idea and it also seems to work.
See below for the patch. (Note that it is the output of
git diff 514f21cd4156c68e17 utilities/runlatex.sh )
I have not enough time to do git commit & git format patch right now...

>> @@ -56,7 +56,7 @@ do
>>  	then
>>  		echo "----- Fatal latex error, see $basename.log for details. -----"
> 
> Also given the loosening above, should there be an "exit 1" here?

Yes, I think so. (This is added in the following patch)
> 
>>  	fi
>> -	if test "$iter" -eq 4
>> +	if test "$iter" -eq 5
>>  	then
>>  		echo "Iteration limit: $iter passes through pdflatex"
>>  		exit 1
>> -- 
>> 1.9.1
>>
> 
> 

Can you try this one?
Thanks, Akira

---
diff --git a/utilities/runlatex.sh b/utilities/runlatex.sh
index 8d2d77a..eba7e16 100644
--- a/utilities/runlatex.sh
+++ b/utilities/runlatex.sh
@@ -47,7 +47,8 @@ then
                echo "No bibliography directory, skipping bibtex."
        fi
 fi
-while grep -q 'LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.' $basename.log
+while grep -q 'LaTeX Warning: There were undefined references' $basename.log || \
+    grep -q 'LaTeX Warning: Label(s) may have changed. Rerun to get cross-references right.' $basename.log
 do
        iter=`expr $iter + 1`
        echo "pdflatex $iter"
@@ -55,8 +56,9 @@ do
        if grep -q '! Emergency stop.' $basename.log
        then
                echo "----- Fatal latex error, see $basename.log for details. -----"
+               exit 1
        fi
-       if test "$iter" -eq 4
+       if test "$iter" -eq 5
        then
                echo "Iteration limit: $iter passes through pdflatex"
                exit 1
