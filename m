Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=lmw+k+uRmkERGvZ1vkd9TNGz2eaa3o7LsRMN7xE/oEc=;
        b=NpRdEMuvaog7qAFJYhjgZaJPoVlGmcwYqnXAMDLMmBDEdMXwe9EuTGw30nW5oxrJYq
         4Dj6PZzP9sG/oVyIUUZD/uAJYsZkDYplYlgQ7jchs7rzf5GgUoIA68/yL95UldXo3Z2m
         PRMIX3q2t6SjphZlcwdNRHb6Krfrv296/ksp1UF9W22aHs9Bu4dHPzluo2rOcaimH5qL
         seexPqMGYfnYIw27eCqGpPKqivtYv2GCy3J1j2CPcEameG6eXTdnpmVRmrPd+9TFOepJ
         sGIJVZrpDl+rtcy7FAc0UqYgZG79wgmMlY1qJgzFilJKT2cuN7qoBF5d9oWZ0Spj+Nth
         Sezg==
Subject: Re: [PATCH 1/6] datastruct/hash: Simplify hash_resize.c
References: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
 <7155cb3d-fb2c-f848-a183-1c8dcc0bafa5@gmail.com>
 <CABoNC83-CFLuHzFurZG6UT=tJFDMzYxGZr-+MrkDPtcCgETa2w@mail.gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <ca2ea462-1e4a-7361-d2f5-48dc7165bdca@gmail.com>
Date: Mon, 14 Jan 2019 22:22:25 +0900
MIME-Version: 1.0
In-Reply-To: <CABoNC83-CFLuHzFurZG6UT=tJFDMzYxGZr-+MrkDPtcCgETa2w@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: Junchang Wang <junchangwang@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.ibm.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

Hi Junchang, 

On 2019/01/14 18:31:21 +0800, Junchang Wang wrote:
> FCV_SNIPPET" blocks are used to hide
> code for debugging
> 
> On Mon, Jan 14, 2019 at 7:31 AM Akira Yokosawa <akiyks@gmail.com> wrote:
>>
>> From 1ffe7edfb90cbb8efb2a33d2ae8c3e855e684acf Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Sun, 13 Jan 2019 19:47:23 +0900
>> Subject: [PATCH 1/6] datastruct/hash: Simplify hash_resize.c
>>
>> By keeping updating the current (old) hash table until resizing
>> completes, hashtab_lookup() only needs to see the current hash table.
>> Instead, hashtab_add() and hashtab_del() need to update the bucket in
>> the current hash table as well as that in the new hash table if
>> hashtab_lock_mod() has locked the new bucket.
>>
>> This simplifies the lookup side and no performance degradation
>> is expected as long as no resizing is in progress.
>>
>> Note that during resize operation, the cost of updates can be
>> doubled in the worst case.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>>  CodeSamples/datastruct/hash/hash_resize.c | 56 ++++++++++++++-----------
>>  CodeSamples/datastruct/hash/hashtorture.h |  6 ++-
>>  datastruct/datastruct.tex                 | 69 ++++++++++---------------------
>>  3 files changed, 59 insertions(+), 72 deletions(-)
>>
>> diff --git a/CodeSamples/datastruct/hash/hash_resize.c b/CodeSamples/datastruct/hash/hash_resize.c
>> index 9f9fe8c..e475910 100644
>> --- a/CodeSamples/datastruct/hash/hash_resize.c
>> +++ b/CodeSamples/datastruct/hash/hash_resize.c
>> @@ -30,7 +30,9 @@
>>  struct ht_elem {
>>         struct rcu_head rh;
>>         struct cds_list_head hte_next[2];               //\lnlbl{ht_elem:next}
>> -       unsigned long hte_hash;
>> +#ifndef FCV_SNIPPET
>> +       unsigned long hte_hash[2];
>> +#endif /* #ifndef FCV_SNIPPET */
> 
> Hi Akira,
> 
> I understand that the micro FCV_SNIPPET is used to hide code for
> checking hash value in this patch set. I just curious about the exact
> meaning of the term FCV_SNIPPET itself. Specifically, what does the
> acronym FCV stand for? I encountered it multiple times while checking
> the code of perfbook, but didn't find any documentation.

Brief documentation is given in the header of utilities/fcvextract.pl.
"FCV" came from a LaTeX package name "fancyvrb".
The macro FCV_SNIPPET is not supposed to be actually defined.
In this particular case, defining it can eliminate the code
to check hash values.

Does this short answer make sense to you?

To add explanation of FCV_SNIPPET and other new features of
fcvextract.pl in the style guide is on my to-do list.

        Thanks, Akira

> 
> Thanks,
> --Junchang
> 
> 
[...]

