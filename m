Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=Vg1eMiR/pzDZ3+V8rbhx5yqIJNuOjJDzjXHmkTHhcwM=;
 b=Mop6pCEdzMdl9nkFuRjTsfCB16ypXofmbQV2CJiRJpav3wEAkABNucJZpOaXgVKbfF
 Q6hZ/0qGiJIUShEcrtbGmZwVawejRenNDdqG/FqilPrxkCd2eP7o8YkGCXpyFkZlT73i
 3/GNasX64GaHO18qGQL3nAe2AnFzFbS1SB7nVenwZ5duivpGRTmrOZR8Y7hJVEpKGniX
 WjaimmE+jUHtNgCOUK898HNaNAMrHrmM2WqT3HXt/ra6SGxt6F6AZCD7VSj20FiMI9Zb
 8bgOHgN82fOSP8JW6oLP38EvwhXAWJSDrI/KGZrhZTDnDxJfKJnMabdah9EYkRzMUru6 QgaA==
Subject: Re: [PATCH 3/4] defer/whichtochoose: Trim a sentence
References: <1468655930-9894-1-git-send-email-sj38.park@gmail.com>
 <1468655930-9894-4-git-send-email-sj38.park@gmail.com>
 <e8aae464-9c9c-411b-597b-50344d81612b@gmail.com>
 <alpine.DEB.2.10.1607170830180.17560@hxeon>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <17d7718a-ded6-7144-dc42-1a2bee562189@gmail.com>
Date: Sun, 17 Jul 2016 11:16:57 +0900
MIME-Version: 1.0
In-Reply-To: <alpine.DEB.2.10.1607170830180.17560@hxeon>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: SeongJae Park <sj38.park@gmail.com>
Cc: paulmck@linux.vnet.ibm.com, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On 2016/07/17 08:40:54 +0900, SeongJae Park wrote:
>
>
> On Sun, 17 Jul 2016, Akira Yokosawa wrote:
>
>> Hi,
>>
>> On 2016/07/16 16:58:49 +0900, SeongJae Park wrote:
>>> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
>>> ---
>>> defer/whichtochoose.tex | 2 +-
>>> 1 file changed, 1 insertion(+), 1 deletion(-)
>>>
>>> diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
>>> index 648cdc8..884de9d 100644
>>> --- a/defer/whichtochoose.tex
>>> +++ b/defer/whichtochoose.tex
>>> @@ -135,7 +135,7 @@ capable of unconditionally acquiring references.
>>> The entry for sequence locks is ``N/A'' because, again, sequence locks
>>> detect updates rather than acquiring references.
>>> Reference counting and hazard pointers require that traversals be
>>> -restarted from the beginning should a given acquisition fail because
>>> +restarted from the beginning if a given acquisition fail because
>>
>> I can't get the point of this change. Original sentence seems quite natural
>> for me.
>
> Well, I thought it would be easier to understand the meaning for poor
> English speakers like me, though judging is Paul's right.  So, please feel
> free to discard this patch if you think it's unnecessary, Paul.  BTW, I
> think I found one trivial grammar mistake here:
> `s/a given acquisition fail/a given acquisition fails/`.
>
>>
>>> the currrent object might be removed and all of its
>>> possible successsors might be not only be removed, but also freed.
>>> For example, when using reference counting or hazard pointers to
>>>
>>
>> However, there are typos here. We need to modify as follows.
>>
>> -the currrent object might be removed and all of its
>> -possible successsors might be not only be removed, but also freed.
>> +the current object might be removed and all of its
>> +possible successors might be not only be removed, but also freed.
>

As I reread the sentence, there is an unnecessary "be" here.

-the currrent object might be removed and all of its
-possible successsors might be not only be removed, but also freed.
+the current object might be removed and all of its
+possible successors might be not only removed, but also freed.

Or we can say:

+the current object might be removed and all of its
+possible successors might not only be removed, but also be freed.

I agree with you that this sentence is fairy complicated.
There might be a better way to rephrase, for example, denoting
the end of that-clause by a comma as appended:

                                            Thanks, Akira

-------------------------------------------------------------
commit 137f7250edbd01b1eab4cbd02449228a949ac2cf
Author: Akira Yokosawa <akiyks@gmail.com>
Date:   Sun Jul 17 10:42:56 2016 +0900

     defer/whichtochoose: Rephrase a sentence
     
     This commit adds a comma to denote the end of that-clause.
     It also fixes a few typos including the entry of sequence locks
     in Table 9.6.
     
     Reported-by: SeongJae Park <sj38.park@gmail.com>
     Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

diff --git a/defer/whichtochoose.tex b/defer/whichtochoose.tex
index 648cdc8..923c3b3 100644
--- a/defer/whichtochoose.tex
+++ b/defer/whichtochoose.tex
@@ -57,7 +57,7 @@
  	Reader Reference Acquisition
  		& Can fail (conditional)
  			& Can fail (conditional)
-				& Unsafe
+				& N/A
  					& Cannot fail (unconditional) \\
  	\hline
  	Memory Footprint
@@ -135,9 +135,9 @@ capable of unconditionally acquiring references.
  The entry for sequence locks is ``N/A'' because, again, sequence locks
  detect updates rather than acquiring references.
  Reference counting and hazard pointers require that traversals be
-restarted from the beginning should a given acquisition fail because
-the currrent object might be removed and all of its
-possible successsors might be not only be removed, but also freed.
+restarted from the beginning should a given acquisition fail, because
+the current object might be removed and all of its
+possible successors might be not only removed, but also freed.
  For example, when using reference counting or hazard pointers to
  protect a tree traversal, any reference-acquisition failure requires
  that the traversal be restarted from the root of the tree.


