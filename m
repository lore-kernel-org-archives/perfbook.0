Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=qSf5y9gZEr3X2OGykugeEbjnPN0XdQtI2qahE/JBL50=;
 b=EiHfUliv7t4PbwjgcF4m46YufH94S10wiFw1BZWyazHBURMfbfKa8yy4+Nn+UyGlex
 xhaTOMybc3bcWEfMczJxnV5QxTOyicjhId6pvTd5mLI0LR6NBkOt7mH512bXxJidql+j
 hbeuFypKIXp/eA/JxATYO26yA1AFczzC1dKTiQ0YbarAcRstwg5veDr6PFzSm4DKhDLi
 1jkHsZllTsPNeyNlXC4yKZDFP7NL6tlTg3ZCWyIcHj6hSbX4X/2CEqZbZ0pVSCIMKWJ/
 4V0ceFIB+rTsaHHQmefDU7E51ve8UCkjwZhpw7bH5F4JP4KY4nIwl8BLfei+2vMzF20A
 M2fA==
MIME-Version: 1.0
In-Reply-To: <82836fa2-dda7-8f20-a686-29b44ece3469@gmail.com>
References: <1494515022-30278-1-git-send-email-junchangwang@gmail.com>
 <1494515022-30278-3-git-send-email-junchangwang@gmail.com>
 <82836fa2-dda7-8f20-a686-29b44ece3469@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Sun, 14 May 2017 21:28:56 +0800
Message-ID: 
 <CABoNC83JGhAtJQc3sEGR0VWCM72nObOJrC2RULWy+c3rd6PU-A@mail.gmail.com>
Subject: Re: [PATCH 2/2] count_stat_eventual: Add READ_ONCE() to protect
 global shared variable stopflag
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

Hi Akira,

Good comments! Please see below:

On Sun, May 14, 2017 at 6:57 PM, Akira Yokosawa <akiyks@gmail.com> wrote:
> Hi Jason & Paul,
>
> So, here is a comment regarding 2/2 of this patch set.
> I'm aware that this patch only touches slow path, but anyway...
>
> On 2017/05/11 23:03:42 +0800, Junchang Wang wrote:
>> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>> ---
>>  CodeSamples/count/count_stat_eventual.c | 11 ++++++-----
>>  1 file changed, 6 insertions(+), 5 deletions(-)
>>
>> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
>> index cbde4aa..2caebfd 100644
>> --- a/CodeSamples/count/count_stat_eventual.c
>> +++ b/CodeSamples/count/count_stat_eventual.c
>> @@ -40,15 +40,15 @@ void *eventual(void *arg)
>>       int t;
>>       unsigned long sum;
>>
>> -     while (stopflag < 3) {
>> +     while (READ_ONCE(stopflag) < 3) {
>>               sum = 0;
>>               for_each_thread(t)
>>                       sum += READ_ONCE(per_thread(counter, t));
>>               WRITE_ONCE(global_count, sum);
>>               poll(NULL, 0, 1);
>> -             if (stopflag) {
>> +             if (READ_ONCE(stopflag)) {
>>                       smp_mb();
>> -                     stopflag++;
>> +                     WRITE_ONCE(stopflag, READ_ONCE(stopflag) + 1);
>
> If I'm reading this correctly, the smp_mb() is to ensure the ordering of write
> to global_count and write to stopflag.

Besides that, smp_mb() is to ensure the correctness of WAR of
stopflag, because stopflag works as a shared variable to synchronize
two threads. I know it's not necessary for x86/gcc, but as Paul has
pointed out, other architectures/Compilers may need it :-).

>This "if" branch is taken after
> count_cleanup()'s update of stopflag is observed.  After the update,
> only the "eventual()" thread updates stopflag. So, the READ_ONCE() within
> the WRITE_ONCE() is not necessary.
> To make the locality obvious, it might be better to hold the value in an auto
> variable.
> Here is my version of the entire eventual() function. Note that read of stopflag
> is not necessary at the beginning of the while loop.
>
> void *eventual(void *arg)
> {
>         int t;
>         unsigned long sum;
>         int stopflag_l = 0;
>
>         while (stopflag_l < 3) {
>                 sum = 0;
>                 for_each_thread(t)
>                         sum += READ_ONCE(per_thread(counter, t));
>                 WRITE_ONCE(global_count, sum);
>                 poll(NULL, 0, 1);
>                 if ((stopflag_l = READ_ONCE(stopflag)) != 0) {
>                         smp_mb();
>                         WRITE_ONCE(stopflag, ++stopflag_l);
>                 }
>         }
>         return NULL;
> }
>

Personally, I don't like to add too many implications in the code such
as excessive optimizations unless we have a strong reason (performance
gain).  Excessive optimizations may confuse compilers and other
programmers. But again, I agree your code might be slightly better in
performance :-).


>>               }
>>       }
>>       return NULL;
>> @@ -66,8 +66,9 @@ void count_init(void)
>>
>>  void count_cleanup(void)
>>  {
>> -     stopflag = 1;
>> -     while (stopflag < 3)
>> +     WRITE_ONCE(stopflag, 1);
>> +     smp_mb();
>
> Is this extra smp_mb() really necessary?
> We'll loop until stopflag becomes 3 anyway, we can rely on memory coherency
> for the updated value to propagate.
>

It's necessary to protect RAW of stopflag on weak consistency machines :-).

Cheers!
--Jason

>> +     while (READ_ONCE(stopflag) < 3)
>>               poll(NULL, 0, 1);
>>       smp_mb();
>
> This smp_mb() pairs with the smp_mb() in eventual() and ensures the value of
> global_count to be read in read_count() is the one written preceding the
> update of stopflag.
>
> Am I reading right?
>
>                        Thanks, Akira
>
>>  }
>>

