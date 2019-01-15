Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=+aT1BCfpDibim3yE5s+uU9ZfFYR7YWwzngZ9bIlGbzA=;
        b=an9v1jDyUx1wIgY/anjckuEaCFvyIDiwyfUNT3hWLkBr+ksbwdQEaAsahglZg+2Xkf
         +zmMIwUinLJFFCJHxaH8Q7mJsI5qpWpQ4VsMwI1rsTo7N9ihRqgTAME7YZJ22l29hxC9
         sESehfBATMw+yfiVx81KGpj2CA59cJt6vmk5y1ZLJffdImuddohvVsPPFo3OEDi4tr3B
         zJ9N82Cy4glwoojBvXnHVPCsKEU0+p39YgOpRVpPKOeE0p9c3E2yux/XhQqRzwEaQWca
         5jWji3Z+u8YQJRTtgmU0b2Zwrly6k8YFH62LE7o/GfYNEddK6NJnIXM0gMRBj10jVXlR
         KVzQ==
Subject: Re: [PATCH 0/6] Simplify hash_resize.c
References: <dff55e7c-6e93-8f4a-79fd-f400ed3b38f8@gmail.com>
 <20190114021024.GP1215@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <8dcb7b16-d7c2-b336-de97-469fd944f72c@gmail.com>
Date: Wed, 16 Jan 2019 07:29:53 +0900
MIME-Version: 1.0
In-Reply-To: <20190114021024.GP1215@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2019/01/13 18:10:24 -0800, Paul E. McKenney wrote:
> On Mon, Jan 14, 2019 at 08:28:27AM +0900, Akira Yokosawa wrote:
>> >From 7b69a9b37ba9a73a50aad5cbb097235ddfe75870 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Mon, 14 Jan 2019 07:25:14 +0900
>> Subject: [PATCH 0/6] Simplify hash_resize.c
>>
>> Hi Paul,
>>
>> This patch set updates hash_resize.c, which you suggested for me to
>> take over, and the related text.
>>
>> I added a couple of Quick Quizzes as well, and in one of them,
>> I included your version of hash_resize.c.
>>
>> Patch #1 updates hash_resize.c in the way I suggested. Note that
>> in this update, "#ifndef FCV_SNIPPET" blocks are used to hide
>> code for debugging (hash value checks) in code snippets.
>> This code can actually be compiled with "-DFCV_SNIPPET" to see
>> the performance without hash value checks.
>>
>> Patch #2 adds a couple of Quick Quizzes. Your version of hash_resize.c
>> is added as hash_resize_s.c.
>>
>> Patch #3 removes unnecessary folding in a code snippet.
>>
>> Patch #4 adjusts a few sentence to the simpler approach.
>>
>> Patch #5 adds another Quick Quiz.
>>
>> Patch #6 adds an "#error" directive for the lack of rcu_barrier().
>>
>> All of the updates in text would need your native eyes to be polished.
> 
> Nice!  Queued and pushed, thank you!  I will review and send any
> needed update by end of tomorrow, Pacific Time.
> 
> Just FYI, this also pushed out a couple of commits starting my rework
> of Section 9.5.1.
> 
>>         Thanks, Akira
>>
>> PS:
>>
>> I couldn't make out your concern of "if we ever want to iterate over
>> the hash table". Can you elaborate it?
> 
> Consider a hash_iterate() function that takes a pointer to a function.
> Then hash_iterate() would invoke this function on each element currently
> in the hash table, for a relatively relaxed definition of "currently".
> With your hash table, a naive implementation might iterate over some
> data items twice due to their being in both the old and the new tables.

If we stick to the old table, which is kept updated during resizing,
there shouldn't be any duplication of items.

What am I missing?

        Thanks, Akira

> 
> But this is not hard to fix, for example, by creating some sort of list
> of elements and the eliminating duplicates, then invoking the specified
> function on each of them.  Of course, this entire process would need to
> be carried out within an RCU read-side critical section.
> 
> This assumes that iteration over the entire hash table is rare, which
> I would certainly expect it to be, given how expensive it is.
> 
> Plus, we currently don't support iteration, so it isn't currently a
> problem anyway.  ;-)
> 
> 							Thanx, Paul
> 
>> --
>> Akira Yokosawa (6):
>>   datastruct/hash: Simplify hash_resize.c
>>   datastruct/hash: Add a couple of Quick Quizzes regarding hash_resize.c
>>   datastruct/hash: Fix unnecessary folding in code snippet
>>   datastruct/hash: Adjust context to updated code in hash_resize.c
>>   datastruct/hash: Add Quick Quiz on READ_ONCE/WRITE_ONCE in
>>     hash_resize.c
>>   datastruct/hash: Display error msg if rcu_barrier() is not available
>>
>>  CodeSamples/datastruct/hash/Makefile        |   5 +-
>>  CodeSamples/datastruct/hash/hash_resize.c   |  62 +++--
>>  CodeSamples/datastruct/hash/hash_resize_s.c | 365 ++++++++++++++++++++++++++++
>>  CodeSamples/datastruct/hash/hashtorture.h   |  11 +-
>>  datastruct/datastruct.tex                   | 146 +++++++----
>>  5 files changed, 513 insertions(+), 76 deletions(-)
>>  create mode 100644 CodeSamples/datastruct/hash/hash_resize_s.c
>>
>> -- 
>> 2.7.4
>>
> 

