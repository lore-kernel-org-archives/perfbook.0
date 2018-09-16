Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:cc:references:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-language:content-transfer-encoding;
 bh=R7myYL2F0psyoQWv3LT0DFmOJJ6cMXL56BEClfEJ7ts=;
 b=SVcSesDMBtaUDLZGj9ElkjZZTRkr8uyr5j0aDqeKME3us6kx+X5YZzEKwolVSj+ZJ3
 UvOSdFU9yeZYKeSuDEqj9ZzxMYPmh2I++HL4sQ0vqq0aP3EYW8OoVV8mG2q9fE9KEvp3
 weFANiSWJx9nKyrMIBxTckCzuXtkMYKX1DU/HI6wlxZ6NJBvZgL/qSt3INznRRXHlMpu
 x2eaYRdc9ptQjYFYLhNtqIBpvROOlhUN7vrFqAACNssd9yTGCViBFtGx1cFfv8aPzX3f
 Kut0A1YG/vzsre57s7mdwGlnLlyi6jMYsreAxseKLaA9KatiIcKQBn5ltYAn0AJlp+OK
 oiFg==
Subject: Re: [PATCH 2/2] count: Reword Quick Quiz 5.6 to adjust context
References: <2b7297a8-62d2-bcdb-0b41-e3bb1b270a6e@gmail.com>
 <ce79d51e-2557-b855-d7ee-cc9f22f22958@gmail.com>
 <20180916220212.GD652@linux.ibm.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <12b16cc2-02cb-b37d-9de1-f90580af6d91@gmail.com>
Date: Mon, 17 Sep 2018 07:52:19 +0900
MIME-Version: 1.0
In-Reply-To: <20180916220212.GD652@linux.ibm.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
Cc: "Palik, Imre" <imrep.amz@gmail.com>, perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/09/16 15:02:12 -0700, Paul E. McKenney wrote:
> On Sat, Sep 15, 2018 at 11:14:03AM +0900, Akira Yokosawa wrote:
>> >From 7bf9ee029829a53009e29ea23b287bb874bd8ee4 Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Fri, 14 Sep 2018 22:50:04 +0900
>> Subject: [PATCH 2/2] count: Reword Quick Quiz 5.6 to adjust context
>>
>> count_nonatomic.c has lost the explicit "++" operator, so this is
>> my humble attempt to update the question.
>>
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
> 
> I adjusted it slightly, then applied and pushed it, thank you!
> 
> Could you please double check that I didn't mess something up?

Hyperlinks in PDF from \ref{} to line labels by their full name
doesn't work at the moment.  They jump to somewhere near the
Listing.

Actually speaking, I've experimented accurate anchors to line
labels. My plan was to submit the change in a pull request to cover
litmus tests and other types of code samples in the new scheme.
I'll submit a cherry-picked patch as a reply.

(I'll stop CCing Imre in the reply.)

        Thanks, Akira

> 
> 							Thanx, Paul
> 
>> ---
>> Paul,
>>
>> Does this change look reasonable to you?
>> I'm quite sure you will come up with something better. ;-)
>>
>>     Thanks, Akira
>> --
>>  count/count.tex | 4 +++-
>>  1 file changed, 3 insertions(+), 1 deletion(-)
>>
>> diff --git a/count/count.tex b/count/count.tex
>> index cfdacb5..6a48b99 100644
>> --- a/count/count.tex
>> +++ b/count/count.tex
>> @@ -193,7 +193,9 @@ Although approximate values do have their place in computing,
>>  accuracies far greater than 50\,\% are almost always necessary.
>>
>>  \QuickQuiz{}
>> -	But doesn't the \co{++} operator produce an x86 add-to-memory
>> +	But doesn't a smart compiler prove
>> +        line~\ref{ln:count:count_nonatomic:inc-read:inc} is equivalent
>> +        to the \co{++} operator and produce an x86 add-to-memory
>>  	instruction?
>>  	And won't the CPU cache cause this to be atomic?
>>  \QuickQuizAnswer{
>> -- 
>> 2.7.4
>>
>>
> 

