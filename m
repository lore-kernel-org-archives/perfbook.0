Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:subject:to:cc:references:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=kZ/X+nucGTJ0F3YWxifVVghIROK/HcMrl6CqOML2Xjo=;
        b=nOOkW62gPahAWk0bteFg2qZhKNw75377bCgxI0K2vn5wQhPk96bqL9wF6S7o9hB+qu
         xkD/AOqcrk7QLCrDI+QhW++fkRwtm3yKi9ypal5ya3RJvzPne7ItUCS9q5kDHQIXeOyD
         v/i6ibgQrGTmJutHyYRKZuv7LMlF/fGhH7xCG6+WbFSnL5LdQn7U/gdrr1/vTIqSRevW
         f1jDLHVLYAZfY4MR7fe3Ouw17tbJuREtUp1s3MLDxo8CAdfNtMsxMR/5ivjo2ECqtZ1j
         Cd9JZXVKiPBO6Z+4BstWrLfxeS032tO3thv9ExTl5Q/bHxzwO2o4Wdh/vpmGaYVLyiZh
         eQ/Q==
From: Akira Yokosawa <akiyks@gmail.com>
Subject: Sporadic SIGSEGV in hash_bkt_rcu and hash_resize (was Re: [PATCH]
 gen_snippet_d.pl: Add rules to ignore editor's backup files)
References: <0f522d14-373b-fdee-6779-eeaa04ee5fa4@gmail.com>
 <20181224235832.GW4170@linux.ibm.com> <20181225005315.GA20719@linux.ibm.com>
 <1e5209af-3c37-fb23-6c95-e3103b211076@gmail.com>
 <5a07540a-7bf0-e0fc-9a02-9eb2314506d6@gmail.com>
 <20181226150018.GY4170@linux.ibm.com>
Message-ID: <d7db020f-b296-97b6-3c2c-5ff31ca142ab@gmail.com>
Date: Mon, 31 Dec 2018 13:37:29 +0900
MIME-Version: 1.0
In-Reply-To: <20181226150018.GY4170@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/12/26 07:00:19 -0800, Paul E. McKenney wrote:
> On Wed, Dec 26, 2018 at 11:31:03PM +0900, Akira Yokosawa wrote:
>> >From 6c0e6e632bbf234de340bcf51acf2007d8e3ac8b Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Wed, 26 Dec 2018 23:11:26 +0900
>> Subject: [PATCH] gen_snippet_d.pl: Add rules to ignore editor's backup files
>>
>> Excerpt from Paul's report:
>>     $ make
>>     sh ./utilities/gen_snippet_d.sh
>>     sh utilities/autodate.sh >autodate.tex
>>     CodeSamples/datastruct/hash/hash_resize.c --> CodeSamples/datastruct/hash/hash_resize@data.fcv
>>     [...]
>>     CodeSamples/datastruct/hash/.hash_resize.c.swp --> CodeSamples/datastruct/hash/CodeSamples/datastruct/hash.fcv
>>     utilities/fcvextract.pl CodeSamples/datastruct/hash/.hash_resize.c.swp hash > CodeSamples/datastruct/hash/CodeSamples/datastruct/hash.fcv
>>     /bin/bash: CodeSamples/datastruct/hash/CodeSamples/datastruct/hash.fcv: No such file or directory
>>     make: *** [CodeSamples/datastruct/hash/CodeSamples/datastruct/hash.fcv] Error 1
>>
>> .hash_resize.c.swp is a swap file of vim, which causes an invalid
>> dependency rule to be emitted.
>>
>> To prevent such errors, ignore .swp files as well as emacs' backup
>> files ending in "~" and "#" from the search results in
>> gen_snippet_d.pl.
>>
>> Reported-by: Paul E. McKenney <paulmck@linux.ibm.com>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>> Paul,
>>
>> This should ignore .swp files in the dependency file.
>> Can you test "make" while opening hash_resize.c in vim?
>>
>>         Thanks, Akira
>>
>> PS:
>>
>> I'll comment on the update of Quick Quiz 10.13 later this week.
> 
> Works great, thank you!!!
> 
> It does not handle the case where you are concurrently editing the same
> file with two different instances of "vim", but that could be considered
> a feature rather than a bug.  ;-)  So no need to modify further.
> 
> Queued, will push with the QQ 10.13 update.
> 
> And have a great week, especially if this is holiday time for you!

Thank you!
Wish we could have a calm new year!

Before commenting on QQ 10.13, I thought I needed to grasp the whole
framework under CodeSamples/datastruct/hash/ and reviewed hashtorture.h.

Just wanted to make sure, I ran the tests with a variety of sets of arguments.

    [NOTE: I ran them on Ubuntu Xenial with
    liburcu-dev/xenial,now 0.9.1-3 and liburcu4/xenial,now 0.9.1-3
    installed. On Trusty with liburcu-dev/trusty,now 0.7.12-0ubuntu2 and
    liburcu1/trusty,now 0.7.12-0ubuntu2 installed, hash_bkt_rcu fails
    differently.]

Some of them sporadically end up in SIGSEGV.
Following is a list of command lines which caused SIGSEGV in 10000 iteration each:

./hash_bkt_rcu --perftest --nreaders 1 --nupdaters 2 --duration 10
./hash_bkt_rcu --perftest --nreaders 1 --nupdaters 3 --duration 10
./hash_bkt_rcu --perftest --nreaders 1 --nupdaters 4 --duration 10
./hash_bkt_rcu --perftest --nreaders 2 --nupdaters 2 --duration 10
./hash_bkt_rcu --perftest --nreaders 2 --nupdaters 3 --duration 10
./hash_bkt_rcu --perftest --nreaders 2 --nupdaters 4 --duration 10
./bash_resize --perftest --nreaders 1 --nupdaters 2 --duration 10
./bash_resize --perftest --nreaders 1 --nupdaters 2 --resizemult 2 --duration 20
./bash_resize --schroidinger --nreaders 1 --nupdaters 1 --resizemult 2 --duration 20

bash_resize looks identical to bash_bkt_rcu as long as resizing is disabled.

So it looks like "--perftest" has some racing issue when "nupderters > 1"
in these tests.

"--schroedinger" works fine as long as resizing is disabled, but does have
issues when resizing is enabled. Is "--schroedinger" supposed to work
with resizing?

I'm not that good at multi-thread debugging, and I've not looked into
the details.

It's not at all urgent, but it would be great if you could look
into them.

        Thanks, Akira

> 
> 							Thanx, Paul
> [...]

