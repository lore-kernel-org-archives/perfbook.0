Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=/ZZWZCxJQ6j/KXLhsHOPA/KFfyuta8uuSTXxqVZ6iuA=;
 b=LBMjY5wOVX7m6Mj4Q/nTaesJL2cyvtY06c6e4NEJq/VCtbjD/Cp243Q5e7wnf09fKc
 kXXkl4SCcnnkx2FzA7sCwVIXHWK9EUlKEdds3PSYCDgibSGQ0yWWrzky/TPzzpFFcc4D
 CSg3iYM3AIefSS1iAyhQ6K+PfRNkoBBPJcKg6+DKjcbUdZWYQxWAW9A5UN+fyIXlEg7y
 6L1nB160kamfaz+V0+CyZY3RZiIgeZ7IHvLbguQZQlm2idGQYjmA/TvHJacV8QJLJ/fA
 U9PUZWQhQ5IauGr1c1HRdu58wvnaZRJg/oqsN+BhPMOxL96S4wjRco98abTEA2pq8E4b
 6VBg==
Subject: Re: [PATCH] memorder: Silence compiler warnings in litmus tests
References: <937d7bee-b3dd-831a-98a5-c0dcab3996b3@gmail.com>
 <20170904165827.GH15437@linux.vnet.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <5cbe4be4-2bdb-dd9a-974a-4a53031e417c@gmail.com>
Date: Tue, 5 Sep 2017 07:35:40 +0900
MIME-Version: 1.0
In-Reply-To: <20170904165827.GH15437@linux.vnet.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2017/09/04 09:58:27 -0700, Paul E. McKenney wrote:
> On Tue, Sep 05, 2017 at 12:05:37AM +0900, Akira Yokosawa wrote:
>> >From 410b1edcf1255563371b9b9bc8b54f10b3125090 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Mon, 4 Sep 2017 23:35:06 +0900
>> Subject: [PATCH] memorder: Silence compiler warnings in litmus tests
>>
>> Silence warnings from gcc:
>>
>>     C-MP+o-r+o-ctrl-o.c:
>>         warning: 'r3' may be used uninitialized in this function
>>         [-Wmaybe-uninitialized]
>>     C-W+RWC+o-mb-o+a-o+o-mb-o.c, C-W+RWC+o-r+a-o+o-mb-o.c:
>>         warning: assignment makes pointer from integer without a cast
>>         [-Wint-conversion]
>>     C-W+RWC+o-mb-o+a-o+o-mb-o.c, C-W+RWC+o-r+a-o+o-mb-o.c:
>>         warning: cast from pointer to integer of different size
>>         [-Wpointer-to-int-cast]
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> Good catches, fixed, thank you!
> 
> I am clearly going to have train myself to scroll up beyond the
> final-state histogram, aren't I?

;-)

I noticed these warnings when I cross compiled on PPC.
You can see warnings (without executing) on x86 by:

    $ make cross-x86
    $ cd X86
    $ sh comp.sh

Thanks, Akira

> 
> 							Thanx, Paul
> 
>> ---
>>  CodeSamples/advsync/herd/C-MP+o-r+o-ctrl-o.litmus         |  2 +-
>>  CodeSamples/advsync/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus |  6 +++---
>>  CodeSamples/advsync/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus    |  6 +++---
>>  memorder/memorder.tex                                     | 14 +++++++-------
>>  4 files changed, 14 insertions(+), 14 deletions(-)
>>
>> diff --git a/CodeSamples/advsync/herd/C-MP+o-r+o-ctrl-o.litmus b/CodeSamples/advsync/herd/C-MP+o-r+o-ctrl-o.litmus
>> index fe44072..82cf629 100644
>> --- a/CodeSamples/advsync/herd/C-MP+o-r+o-ctrl-o.litmus
>> +++ b/CodeSamples/advsync/herd/C-MP+o-r+o-ctrl-o.litmus
>> @@ -16,7 +16,7 @@ P0(int* x0, int* x1) {
>>
>>  P1(int* x0, int* x1) {
>>  	int r2;
>> -	int r3;
>> +	int r3 = 0;
>>
>>  	r2 = READ_ONCE(*x1);
>>  	if (r2 >= 0)
>> diff --git a/CodeSamples/advsync/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus b/CodeSamples/advsync/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus
>> index 1e0f1b7..23050e6 100644
>> --- a/CodeSamples/advsync/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus
>> +++ b/CodeSamples/advsync/herd/C-W+RWC+o-mb-o+a-o+o-mb-o.litmus
>> @@ -19,8 +19,8 @@ P0(int *x, int *y)
>>
>>  P1(int *y, int *z)
>>  {
>> -	int *r1;
>> -	int *r2;
>> +	int r1;
>> +	int r2;
>>
>>  	r1 = smp_load_acquire(y);
>>  	r2 = READ_ONCE(*z);
>> @@ -28,7 +28,7 @@ P1(int *y, int *z)
>>
>>  P2(int *z, int *x)
>>  {
>> -	int *r3;
>> +	int r3;
>>
>>  	WRITE_ONCE(*z, 1);
>>  	smp_mb();
>> diff --git a/CodeSamples/advsync/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus b/CodeSamples/advsync/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus
>> index a71f1ac..527b373 100644
>> --- a/CodeSamples/advsync/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus
>> +++ b/CodeSamples/advsync/herd/C-W+RWC+o-r+a-o+o-mb-o.litmus
>> @@ -18,8 +18,8 @@ P0(int *x, int *y)
>>
>>  P1(int *y, int *z)
>>  {
>> -	int *r1;
>> -	int *r2;
>> +	int r1;
>> +	int r2;
>>
>>  	r1 = smp_load_acquire(y);
>>  	r2 = READ_ONCE(*z);
>> @@ -27,7 +27,7 @@ P1(int *y, int *z)
>>
>>  P2(int *z, int *x)
>>  {
>> -	int *r3;
>> +	int r3;
>>
>>  	WRITE_ONCE(*z, 1);
>>  	smp_mb();
>> diff --git a/memorder/memorder.tex b/memorder/memorder.tex
>> index 624f9a8..151af4e 100644
>> --- a/memorder/memorder.tex
>> +++ b/memorder/memorder.tex
>> @@ -1567,7 +1567,7 @@ P0(int* x0, int* x1) {
>>
>>  P1(int* x0, int* x1) {
>>    int r2;
>> -  int r3;
>> +  int r3 = 0;
>>
>>    r2 = READ_ONCE(*x1);
>>    if (r2 >= 0)
>> @@ -2162,8 +2162,8 @@ P0(int *x, int *y)
>>
>>  P1(int *y, int *z)
>>  {
>> -  int *r1;
>> -  int *r2;
>> +  int r1;
>> +  int r2;
>>
>>    r1 = smp_load_acquire(y);
>>    r2 = READ_ONCE(*z);
>> @@ -2171,7 +2171,7 @@ P1(int *y, int *z)
>>
>>  P2(int *z, int *x)
>>  {
>> -  int *r3;
>> +  int r3;
>>
>>    WRITE_ONCE(*z, 1);
>>    smp_mb();
>> @@ -2258,8 +2258,8 @@ P0(int *x, int *y)
>>
>>  P1(int *y, int *z)
>>  {
>> -  int *r1;
>> -  int *r2;
>> +  int r1;
>> +  int r2;
>>
>>    r1 = smp_load_acquire(y);
>>    r2 = READ_ONCE(*z);
>> @@ -2267,7 +2267,7 @@ P1(int *y, int *z)
>>
>>  P2(int *z, int *x)
>>  {
>> -  int *r3;
>> +  int r3;
>>
>>    WRITE_ONCE(*z, 1);
>>    smp_mb();
>> -- 
>> 2.7.4
>>
> 
> 

