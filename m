Return-Path: <paulmckrcu+caf_=paulmck=linux.vnet.ibm.com@gmail.com>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:34421 "EHLO
 mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org with
 ESMTP id S1751035AbdEPPFQ (ORCPT <rfc822;perfbook@vger.kernel.org>); Tue, 16
 May 2017 11:05:16 -0400
Received: by mail-pg0-f65.google.com with SMTP id u187so21705941pgb.1 for
 <perfbook@vger.kernel.org>; Tue, 16 May 2017 08:05:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:from:cc:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=+I1PANbVH7MRZz9LYyU+wkuanv+F4ZKMk0i/mv+EHA4=;
 b=iuenwuLXpRiG0+XkFTNEKcDjM6CMJsniINNcYxJoZ8cKhID8VU2slOvAVIxBYhufa0
 22K3VLL8nuid1SNQlBewUEOAaLQEUxKxaYYw9yM9fPgIjGNerL/MF+cgkaknLF4GU8bg
 ZCheHbpLRpqmgrBxArHGkbAyVhL1LyoO2yk5FUnPWj6FOQuNdLjfX6P/iJ7VjImPlKV5
 NLI4LUtb+hNsc1gooRZhfDEtHw59iT4FCyCagjj9zXN5XvZ4RQnwiWbOJ968sfCO/TO3
 L77ToX8fElbL2490v6tuH4zjuFB+eUsfWITzqrjpsxfpSmrR4fkrO0Umz1PXvTWSPdee
 rBKw==
Subject: Re: [PATCH] count_stat_eventual: Remove unnecessary READ_ONCE() and
 smp_mb()
References: <1494942026-6736-1-git-send-email-junchangwang@gmail.com>
 <CABoNC830pyg6WnFs6-Pk5x0PvkrZksyrhbAE_WZtrH4oOW3F-A@mail.gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <255c194b-0424-ff3c-ac4b-e0cb8b372e10@gmail.com>
Date: Wed, 17 May 2017 00:05:12 +0900
MIME-Version: 1.0
In-Reply-To: 
 <CABoNC830pyg6WnFs6-Pk5x0PvkrZksyrhbAE_WZtrH4oOW3F-A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: perfbook-owner@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>
To: Junchang Wang <junchangwang@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>

On 2017/05/16 22:04:59 +0800, Junchang Wang wrote:
> Hi Paul and Akira,
> 
> This is the updated patch according to the discussion with Akira and
> following is the summary. Please take a look. Comments are welcome!
> 
> In function eventual( ), if the value of stopflag become larger than
> zero (the ''if'' branch is taken), then only the "eventual()" thread
> updates stopflag. So, the READ_ONCE() within the WRITE_ONCE() is not
> necessary. Remove it.
> In function count_cleanup( ), there is no need to run smp_mb( ) in
> between statement writing to and statement reading from the same
> variable, stopflag. Remove smp_mb().
> 
> 
> Thanks,
> --Jason
> 
> On Tue, May 16, 2017 at 9:40 PM, Junchang Wang <junchangwang@gmail.com> wrote:
>> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>

Hi Jason,

Glad to know you agree with me here!

Can you resubmit a v2 of the patch to include the message above in the commit
log?  It would be easier for Paul to apply.
Also, since I didn't created the patch itself, I'd like you to use the following
tag instead:

Suggested-by: Akira Yokosawa <akiyks@gmail.com>

in front of your Signed-off-by.

                 Thanks, Akira

>> ---
>>  CodeSamples/count/count_stat_eventual.c | 8 ++++----
>>  1 file changed, 4 insertions(+), 4 deletions(-)
>>
>> diff --git a/CodeSamples/count/count_stat_eventual.c b/CodeSamples/count/count_stat_eventual.c
>> index 464de30..1365168 100644
>> --- a/CodeSamples/count/count_stat_eventual.c
>> +++ b/CodeSamples/count/count_stat_eventual.c
>> @@ -40,16 +40,17 @@ void *eventual(void *arg)
>>  {
>>         int t;
>>         unsigned long sum;
>> +       int stopflag_l = 0;
>>
>> -       while (READ_ONCE(stopflag) < 3) {
>> +       while (stopflag_l < 3) {
>>                 sum = 0;
>>                 for_each_thread(t)
>>                         sum += READ_ONCE(per_thread(counter, t));
>>                 WRITE_ONCE(global_count, sum);
>>                 poll(NULL, 0, 1);
>> -               if (READ_ONCE(stopflag)) {
>> +               if ((stopflag_l = READ_ONCE(stopflag)) != 0) {
>>                         smp_mb();
>> -                       WRITE_ONCE(stopflag, READ_ONCE(stopflag) + 1);
>> +                       WRITE_ONCE(stopflag, ++stopflag_l);
>>                 }
>>         }
>>         return NULL;
>> @@ -68,7 +69,6 @@ void count_init(void)
>>  void count_cleanup(void)
>>  {
>>         WRITE_ONCE(stopflag, 1);
>> -       smp_mb();
>>         while (READ_ONCE(stopflag) < 3)
>>                 poll(NULL, 0, 1);
>>         smp_mb();
>> --
>> 2.7.4
>>
> 

