Return-Path: <SRS0=DGX5=DK=gmail.com=junchang2020@kernel.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=wrpTZYXkZRII3HG0T8UXATQqN6mKlHzvSxMyWI/vat8=;
        b=h3dAFNAt3RJmqmPLU+ZTa5tqj8gdnU+kJi8f8HnsLZRpvU/AthTV2LGzPzmVatviVX
         kYR0DuhhrH925KII4XOizGjTwXVsd4ESfFACaU0ePKeYdRfkhmG6T1Qwn2cl8BcESzpc
         040vN521jdvMMZq1A5J7EvFHJiOYVxyJ6tNtjfDP5kvXI5PAUt+W7zF6JdFr5nj5Pbfr
         QpIqeEjmHm6kKnnOvFnIC1iruvmH6/MrffQjnCM5mCz4OwsBH1H6RVtW6aaPdyxrMdug
         b5Xfm1xr+lvSt0sQEKOIIRjjHM3VCnq7j3ANO4HENxq9QWR8U1Q+W0k0c34OHQSdqtJe
         tEOA==
Date: Sat, 3 Oct 2020 12:28:47 +0800
From: Junchang Wang <junchang2020@gmail.com>
Subject: Re: [PATCH] api-gcc.h: fix typos in the functions atomic_add_*
Message-ID: <20201003042847.GA32682@HongKong.localdomain>
References: <20200929084006.GA31703@HongKong.localdomain>
 <d634acb5-f4b4-4e76-fecf-91a0ca541e79@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d634acb5-f4b4-4e76-fecf-91a0ca541e79@gmail.com>
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@kernel.org, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Sat, Oct 03, 2020 at 11:24:52AM +0900, Akira Yokosawa wrote:
>Hi Junchang,
>
>On Tue, 29 Sep 2020 16:40:06 +0800, Junchang Wang wrote:
>> The typo in atomic_add_return() incurs tricky bugs. For example, the current
>> atomic_dec_return() is indeed an atomic_add_return(). A similar typo appears
>> in the function atomic_add_negative().
>
>Nice catches!

Hi Akira,

>
>You mean the current atomic_add_return(), atomic_sub_return(), and
>atomic_dec_return() actually are atomic_inc_return(), don't you?
>

Yes. I meant to say "actually". :-)

>I wondered if these typos have affected code under CodeSamples.
>

No. Like you have mentioned in your mail, the affected functions are
atomic_add_negative(), atomic_add_return(), atomic_dec_return(), and
atomic_sub_return(). The code in CodeSamples does not use the first three
functions, and the last function is only used by SMPdesign/lockrwdeq.c which
does not appear in perfbook.

I encountered the bug when I was evaluating my parallel code, which utilizes
atomic_dec_return() in api-gcc.h, on the hashtorture benchmarking framework.
It would be great if we can fix the bugs because other programmers like me
will probably write their code based on the sample codes in perfbook.


Thanks,
--Junchang

>Looks like atomic_add_negative(), atomic_add_return(), and
>atomic_dec_return() are defined in api-gcc.h, but not used in anywhere
>under CodeSamples.
>
>On the other hand, atomic_sub_return() is used in SMPdesign/lockrwdeq.c.
>
>./SMPdesign/lockrwdeq.c:100:	if (atomic_sub_return(2, &d->counter) < 1) {
>./SMPdesign/lockrwdeq.c:116:	if (atomic_sub_return(2, &d->counter) < 1) {
>./SMPdesign/lockrwdeq.c:131:	if (atomic_sub_return(1, &d->counter) < 1) {
>./SMPdesign/lockrwdeq.c:143:	if (atomic_sub_return(1, &d->counter) < 1) {
>
>All of them are actually atomic_inc_return(&d->counter)s!
>
>Building lockrwdeq and running it at current master sometimes segfaults or deadlocks.
>
>Applying Junchang's patch makes it much stable.
>I've never looked into lockrqdeq.c (because it is not cited from perfbook text)
>and don't have any clue.
>
>Paul, what is your expectation of lockrwdeq's behavior?
>
>        Thanks, Akira
>
>> 
>> Signed-off-by: Junchang Wang <junchang2020@gmail.com>
>> ---
>>  CodeSamples/api-pthreads/api-gcc.h | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>> 
>> diff --git a/CodeSamples/api-pthreads/api-gcc.h b/CodeSamples/api-pthreads/api-gcc.h
>> index fbbedf2..9ad8a68 100644
>> --- a/CodeSamples/api-pthreads/api-gcc.h
>> +++ b/CodeSamples/api-pthreads/api-gcc.h
>> @@ -140,7 +140,7 @@ static __inline__ int atomic_inc_and_test(atomic_t *v)
>>   */
>>  static __inline__ int atomic_add_negative(int i, atomic_t *v)
>>  {
>> -	return __atomic_add_fetch(&v->counter, 1, __ATOMIC_SEQ_CST) < 0;
>> +	return __atomic_add_fetch(&v->counter, i, __ATOMIC_SEQ_CST) < 0;
>>  }
>>  
>>  /**
>> @@ -152,7 +152,7 @@ static __inline__ int atomic_add_negative(int i, atomic_t *v)
>>   */
>>  static __inline__ int atomic_add_return(int i, atomic_t *v)
>>  {
>> -	return __atomic_add_fetch(&v->counter, 1, __ATOMIC_SEQ_CST);
>> +	return __atomic_add_fetch(&v->counter, i, __ATOMIC_SEQ_CST);
>>  }
>>  
>>  static __inline__ int atomic_sub_return(int i, atomic_t *v)
>> 
