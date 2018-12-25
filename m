Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=hgANKB/vpWeP0AK5GF65dhF6anMWrG+JTm82N3pMEhc=;
        b=lhhHwggSyes9/Jxjhc/xOlzWyYyD1ThWKgl5eVP2yLz+Ks+CPiHgTIgs9Tg1hykzSO
         NFSDh24wFhRGBT7kQYiRFd17w+pslADpSQY5n6b/oAiMCbwvYJAxCQMbDo2P+ykfThfU
         R64eNzw0ebljD7Nw/53FmABWLg6wWP2YkxlpEh8K+LYiwn8kn+HSB9CLT9L/jnnwk0M+
         P3CHn46TKctKD24xeVb6XLnZ/RlIZFy0+0OaPmFJiQ3zIDwe290V+ESdE4ShTI2UkZtZ
         7Xp46F/Ryz9P2eqasA1XCyCw13K5gAa3fp/SbLqFPCLdff1Tzxlfcc6shzxXb6AB6q26
         gE5Q==
Subject: Re: [PATCH 00/11] datastruct: Employ new scheme for code snippet
References: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
 <20181224235832.GW4170@linux.ibm.com> <20181225005315.GA20719@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <1e5209af-3c37-fb23-6c95-e3103b211076@gmail.com>
Date: Tue, 25 Dec 2018 23:30:44 +0900
MIME-Version: 1.0
In-Reply-To: <20181225005315.GA20719@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/12/25 9:53, Paul E. McKenney wrote:
> On Mon, Dec 24, 2018 at 03:58:32PM -0800, Paul E. McKenney wrote:
>> On Mon, Dec 24, 2018 at 11:46:23PM +0900, Akira Yokosawa wrote:
>>> Hi Paul,
>>>
>>> This patch set consists of enhancement of fcvextract.pl,
>>> update of snippets in datastruct, and some minor tweaks.
>>>
>>> fcvextract.pl now suppresses comment blocks in C source and
>>> supports alternative code for snippets in #ifndef blocks,
>>> which won't be affected by the suppression of comment blocks.
>>>
>>> Also, labeling of the form /* \lnlbl{label} */ is now supported
>>> in C snippets.
>>>
>>> Patch #1 adds comment block handling to fcvextract.pl, without
>>> changing the default behavior.
>>>
>>> Patch #2 adds a couple of explicit options to snippets which
>>> have comments to be displayed. It also converts alternative
>>> code fragments using "#ifndef FCV_EXCLUDE" so that they survive
>>> comment block suppression.
>>>
>>> Patch #3 changes the default to "keepcomment=no".
>>> This removes a couple of comments in Listings 4.8 and 9.5.
>>>
>>> Patch #4 removes now redundant "\fcvexclude" around comment
>>> blocks. It also uses "#ifndef FCV_SNIPPET" to reduce \fcvexclude
>>> uses.
>>>
>>> Patch #5 adds support of "/* \lnlbl{label} */" labeling.
>>>
>>> Patch #6 updates snippets of hash_bkt.c. "struct hashtab"
>>> now has the "ht_cmp" field and I updated the text to mention
>>> it. You might want to do some rewording.
>>
>> Looks good to me as is.
>>
>>> Patch #7 adds the "ht_cmp" field in the hashdiagram figure
>>> (still in .fig).
>>>
>>> Patch #8 updates the rest of snippets in datastruct. It also
>>> fixes typo in cross references of Listing 10.13.
>>> By this change, an smp_mb() appears in ht_get_bucket()
>>> (Listing 10.10).
>>>
>>> My guess is that the counterpart barrier is the first
>>> synchronize_rcu() in hashtab_resize(). It might deserve some
>>> explanation or a Quick Quiz.  Also, Answer to Quick Quiz 10.13
>>> might need some expansion, since it looks as though hash_reorder.c
>>> used something more than the pure RCU protection. But I might be
>>> completely misreading here...
>>
>> I think I have a bug...
>>
>> So am I smarter now than when I wrote that code, or vice versa?  ;-)
> 
> I believe that I am smarter now, or maybe just more deluded.  Anyway,
> when I changed the code, I go this from the top-level Makefile:
> 
> $ make
> sh ./utilities/gen_snippet_d.sh
> sh utilities/autodate.sh >autodate.tex
> CodeSamples/datastruct/hash/hash_resize.c --> CodeSamples/datastruct/hash/hash_resize@data.fcv
> utilities/fcvextract.pl CodeSamples/datastruct/hash/hash_resize.c hash_resize:data > CodeSamples/datastruct/hash/hash_resize@data.fcv
> CodeSamples/datastruct/hash/hash_resize.c --> CodeSamples/datastruct/hash/hash_resize@get_bucket.fcv
> utilities/fcvextract.pl CodeSamples/datastruct/hash/hash_resize.c hash_resize:get_bucket > CodeSamples/datastruct/hash/hash_resize@get_bucket.fcv
> CodeSamples/datastruct/hash/hash_resize.c --> CodeSamples/datastruct/hash/hash_resize@lock_unlock_mod.fcv
> utilities/fcvextract.pl CodeSamples/datastruct/hash/hash_resize.c hash_resize:lock_unlock_mod > CodeSamples/datastruct/hash/hash_resize@lock_unlock_mod.fcv
> CodeSamples/datastruct/hash/hash_resize.c --> CodeSamples/datastruct/hash/hash_resize@access.fcv
> utilities/fcvextract.pl CodeSamples/datastruct/hash/hash_resize.c hash_resize:access > CodeSamples/datastruct/hash/hash_resize@access.fcv
> CodeSamples/datastruct/hash/hash_resize.c --> CodeSamples/datastruct/hash/hash_resize@resize.fcv
> utilities/fcvextract.pl CodeSamples/datastruct/hash/hash_resize.c hash_resize:resize > CodeSamples/datastruct/hash/hash_resize@resize.fcv
> CodeSamples/datastruct/hash/.hash_resize.c.swp --> CodeSamples/datastruct/hash/CodeSamples/datastruct/hash.fcv
> utilities/fcvextract.pl CodeSamples/datastruct/hash/.hash_resize.c.swp hash > CodeSamples/datastruct/hash/CodeSamples/datastruct/hash.fcv
> /bin/bash: CodeSamples/datastruct/hash/CodeSamples/datastruct/hash.fcv: No such file or directory
> make: *** [CodeSamples/datastruct/hash/CodeSamples/datastruct/hash.fcv] Error 1
> 
> Using "make clean" didn't fix it.  Neither did reverting my change
> to CodeSamples/datastruct/hash/hash_resize.c, which is shown below.
> 
> Ah, I get it now.  I had CodeSamples/datastruct/hash/hash_resize.c
> open in vim, and the scripting attempted to process the resulting
> .hash_resize.c.swp file from vim.  Things started working again after
> I exited from vim.

I see.

I'll add rules in utilities/gen_snippet_d.pl so that those .swp files
will be excluded from the search result.

BTW, the new Quick Quiz 10.14 sounds somewhat inconsistent with
Quick Quiz 10.13 and its answer, doesn't it?

Or am I missing something?

        Thanks, Akira

> 
> 							Thanx, Paul
> 
> ------------------------------------------------------------------------
> 
> diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
> index 662bb90bff14..ccb523bb6c05 100644
> --- a/CodeSamples/datastruct/hash/hash_resize.c
> +++ b/CodeSamples/datastruct/hash/hash_resize.c
> @@ -298,13 +298,14 @@ int hashtab_resize(struct hashtab *htp_master,
>  	for (i = 0; i < htp->ht_nbuckets; i++) {		//\lnlbl{loop:b}
>  		htbp = &htp->ht_bkt[i];				//\lnlbl{get_oldcur}
>  		spin_lock(&htbp->htb_lock);			//\lnlbl{acq_oldcur}
> -		htp->ht_resize_cur = i;				//\lnlbl{update_resize}
>  		cds_list_for_each_entry(htep, &htbp->htb_head, hte_next[idx]) { //\lnlbl{loop_list:b}
>  			htbp_new = ht_get_bucket_single(htp_new, htp_new->ht_getkey(htep), &b);
>  			spin_lock(&htbp_new->htb_lock);
>  			cds_list_add_rcu(&htep->hte_next[!idx], &htbp_new->htb_head);
>  			spin_unlock(&htbp_new->htb_lock);
>  		}						//\lnlbl{loop_list:e}
> +		smp_mb(); /* Fill new buckets before claiming them. */
> +		htp->ht_resize_cur = i;				//\lnlbl{update_resize}
>  		spin_unlock(&htbp->htb_lock);			//\lnlbl{rel_oldcur}
>  	}							//\lnlbl{loop:e}
>  	rcu_assign_pointer(htp_master->ht_cur, htp_new);	//\lnlbl{rcu_assign}
> 

