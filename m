Return-Path: <sj38.park@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=jCIazUM3Pg0UeaoVm/OO0PCm39N6Vnq2RwKHvzBaCIQ=;
 b=aZt49ELy8n1E3XG6qIYR3g/neHXy4VH+PO3jIClQ1iCF60GvkkgwVsZkODI/iT+LFS
 DJzuqPoejx1oV5wOqfZhUO4ZvKzkEZLjp/RRpFu+jfxb2KM65DHctDSjXEcVSsf5SF/t
 KtLjYAyOfN8DDPGc55qg2916W501ceSUFKtKG6XHFtXx/oh1haHKj2f2+EGfnhdxXDZ5
 QuzORBIwzKyOzzY2rFat62M+kG6mfwLVniPMUzWFxkcTgiEqp5NGc3hHXPOehzJC76Yb
 lEanynffJQ02hqWQ9dnnZ71oBO880MG39I3YwkttbIUJobnVPM0rskaOZnFgWQx9kf6Q
 bYyw==
MIME-Version: 1.0
In-Reply-To: <20160927161414.GK14933@linux.vnet.ibm.com>
References: 
 <CAEjAshrzBH+=e7mHU3Dzw5ydOwBFHVtOVU-4Vqg0xJQX3HDewQ@mail.gmail.com>
 <20160921130548.9393-1-sj38.park@gmail.com>
 <20160927161414.GK14933@linux.vnet.ibm.com>
From: SeongJae Park <sj38.park@gmail.com>
Date: Wed, 28 Sep 2016 06:54:31 +0900
Message-ID: 
 <CAEjAshqfKRpR7BSM0uBfZzg_O+=zmVb7dB6P9_r57Wy-mCxt9w@mail.gmail.com>
Subject: Re: [PATCH v2] formal/dyntickrcu: Adjust font size of sample code
Content-Type: text/plain; charset=UTF-8
To: Paul McKenney <paulmck@linux.vnet.ibm.com>
Cc: Yokosawa Akira <akiyks@gmail.com>, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On Wed, Sep 28, 2016 at 1:14 AM, Paul E. McKenney
<paulmck@linux.vnet.ibm.com> wrote:
> On Wed, Sep 21, 2016 at 10:05:48PM +0900, SeongJae Park wrote:
>> Code for `dyntickRCU-irqnn-ssl.spin` has a too long line.  Because the
>> line breaks the layout, this commit reduces font size of the sample code
>> for better layout.
>>
>> Suggested-by: Akira Yokosawa <akiyks@gmail.com>
>> Signed-off-by: SeongJae Park <sj38.park@gmail.com>
>
> Thank you both!
>
> SeongJae, could you please resend the series?  Sorry to be so picky,
> but you might be underestimating my ability to apply the wrong patch
> at the wrong time.  ;-)

Of course I will :)  I will send the series again in reply to this mail.


Thanks, SeongJae Park

>
>                                                         Thanx, Paul
>
>> ---
>>  formal/dyntickrcu.tex | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/formal/dyntickrcu.tex b/formal/dyntickrcu.tex
>> index d0b2c6e..a63d324 100644
>> --- a/formal/dyntickrcu.tex
>> +++ b/formal/dyntickrcu.tex
>> @@ -1252,7 +1252,7 @@ and finally lines~32-43 model \co{rcu_irq_exit()}.
>>
>>  The \co{grace_period()} process then becomes as follows:
>>
>> -{ \scriptsize
>> +{ \fontsize{6.7pt}{8pt}\selectfont
>>  \begin{verbatim}
>>    1 proctype grace_period()
>>    2 {
>> --
>> 2.10.0
>>
>

