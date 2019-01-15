Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=U1CS0854Qo33m7m8Bmr0pCdbyuatJJEHstuiuJcfefU=;
        b=DT+8v+9LRXlVH5tqK+yApHpBqO2ouYkJm2muMhT4t4SUeHxDAdJTxb1RWAl3M8uk0Q
         HZzrpRktHDQqmU/MyPJpI4FdMHetWFqkaT21rNh6fQNM/T1O4V1cuGqOIg8t8BraMSq/
         GFM8AGZFuYOOfdahabnodSvaNiCqL8fbGdP17Xpx63T6FrM8cvkppVoJhlJerCVMvE+d
         ux1fAK82NJA+11fuma5Gm0jO9WfVEORvOrMD+j3dd/MtJF+gmtnOWuddx/QzE0JMZfXJ
         RJyG8jtOfCzMya179ky44h3sQk6WQoFLqrych06+ehl3XuocYOHGeHC/GWy9LQOxSDGO
         Pugw==
Subject: Re: [PATCH 0/6] Simplify hash_resize.c
References: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
 <20190114021024.GP1215@linux.ibm.com> <20190115013337.GA25108@linux.ibm.com>
 <fa8f579d-d14e-1be5-35f7-8f20a22021d6@gmail.com>
 <20190115174304.GB1215@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <239642cb-8c5a-980f-5512-ea2b8cce09ed@gmail.com>
Date: Wed, 16 Jan 2019 07:15:15 +0900
MIME-Version: 1.0
In-Reply-To: <20190115174304.GB1215@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2019/01/15 09:43:04 -0800, Paul E. McKenney wrote:
> On Wed, Jan 16, 2019 at 12:32:52AM +0900, Akira Yokosawa wrote:
>> On 2019/01/14 17:33:37 -0800, Paul E. McKenney wrote:
>>> On Sun, Jan 13, 2019 at 06:10:24PM -0800, Paul E. McKenney wrote:
>>>> On Mon, Jan 14, 2019 at 08:28:27AM +0900, Akira Yokosawa wrote:
>>>>> >From 7b69a9b37ba9a73a50aad5cbb097235ddfe75870 Mon Sep 17 00:00:00 2001
>>>>> From: Akira Yokosawa <akiyks@gmail.com>
>>>>> Date: Mon, 14 Jan 2019 07:25:14 +0900
>>>>> Subject: [PATCH 0/6] Simplify hash_resize.c
>>>>>
>>>>> Hi Paul,
>>>>>
>>>>> This patch set updates hash_resize.c, which you suggested for me to
>>>>> take over, and the related text.
>>>>>
>>>>> I added a couple of Quick Quizzes as well, and in one of them,
>>>>> I included your version of hash_resize.c.
>>>>>
>>>>> Patch #1 updates hash_resize.c in the way I suggested. Note that
>>>>> in this update, "#ifndef FCV_SNIPPET" blocks are used to hide
>>>>> code for debugging (hash value checks) in code snippets.
>>>>> This code can actually be compiled with "-DFCV_SNIPPET" to see
>>>>> the performance without hash value checks.
>>>>>
>>>>> Patch #2 adds a couple of Quick Quizzes. Your version of hash_resize.c
>>>>> is added as hash_resize_s.c.
>>>>>
>>>>> Patch #3 removes unnecessary folding in a code snippet.
>>>>>
>>>>> Patch #4 adjusts a few sentence to the simpler approach.
>>>>>
>>>>> Patch #5 adds another Quick Quiz.
>>>>>
>>>>> Patch #6 adds an "#error" directive for the lack of rcu_barrier().
>>>>>
>>>>> All of the updates in text would need your native eyes to be polished.
>>>>
>>>> Nice!  Queued and pushed, thank you!  I will review and send any
>>>> needed update by end of tomorrow, Pacific Time.
>>>
>>> Here is a summary of changes:
>>>
>>> o	Move the ht_lock_state structure definition to follow the ht
>>> 	structure, matching the order of discussion in the text.
>>> 	Everything seems to build and run OK with this change.
>>> 	Also illustrates the advantages of line labels!  ;-)
>>>
>>> o	I considered inlining ht_search_bucket() into its only caller
>>> 	in hashtab_lookup(), but decided against it.  More flexibility
>>> 	for change with it as is.
>>>
>>> o	I added ht_search_bucket() to the in-text list of things
>>> 	permitting lookups and modifications to run concurrently with
>>> 	a resize operation.
>>>
>>> o	I tweaked the description of hashtab_lock_mod(), hashtab_unlock_mod(),
>>> 	hashtab_add(), and hashtab_del().
>>>
>>> o	I tweaked the QQ asking about searches missing adds during resizes.
>>>
>>> o	English is strange, so "Less Changes" must become "Fewer Changes".
>>
>> Sigh, I thought I knew this rule... Thanks for the fix.
>>
>>>
>>> o	I put the long labels on a single line out of paranoia.
>>>
>>> I pushed these out on a working branch named paulmck.2019.01.14a.  Please
>>> let me know whether I messed anything up, and once it looks good to you,
>>> I will pull these two commits into the master branch.
>>
>> There is an irrelevant clause added in an answer to a QQ.
>> See below for my suggestion. It doesn't sound fluent enough, though.
> 
> Good catch!
> 
> How does the following amended patch look?

It looks perfect!

        Thanks, Akira

> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> commit 731c855ab11b9601a40324c6ef6b5ced6d7833e9
> Author: Akira Yokosawa <akiyks@gmail.com>
> Date:   Tue Jan 15 23:52:27 2019 +0900
> 
>     datastruct/hash: Fix irrelevant clause in answer to quick quiz
>     
>     hashtab_lookup() is not affected by the reordering of ->hbp[] and
>     ->hls_idx[]. Instead, mention the increase of cost at the earlier
>     explanation of hashtab_lookup().
>     
>     Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>     [ paulmck: Wordsmithing. ]
>     Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
> 
> diff --git a/datastruct/datastruct.tex b/datastruct/datastruct.tex
> index d1fde2c7535e..985021e927a8 100644
> --- a/datastruct/datastruct.tex
> +++ b/datastruct/datastruct.tex
> @@ -1189,13 +1189,15 @@ a concurrent resize operation.
>  	either the old bucket if it is not resized yet, or to the new
>  	bucket if it has been resized, and \co{hashtab_del()} removes
>  	the specified element from any buckets into which it has been inserted.
> -	\co{hashtab_lookup()} searches the new bucket if the search
> -	of the old bucket fails.
> +	The \co{hashtab_lookup()} function searches the new bucket
> +	if the search of the old bucket fails, which has the disadvantage
> +	of adding overhead to the lookup fastpath.
>  	The alternative \co{hashtab_lock_mod()} returns the locking
>  	state of the new bucket in \co{->hbp[0]} and \co{->hls_idx[0]}
> -	if resize operation is in progress.
> -	This reordering simplifies \co{hashtab_add()}, but at the expense
> -	of an extra check in \co{hashtab_lookup()}.
> +	if resize operation is in progress, instead of the perhaps
> +	more natural choice of \co{->hbp[1]} and \co{->hls_idx[1]}.
> +	However, this less-natural choice has the advantage of simplifying
> +	\co{hashtab_add()}.
>  
>  	Further analysis of the code is left as an exercise for the reader.
>  } \QuickQuizEnd
> 

