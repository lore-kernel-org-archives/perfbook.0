Return-Path: <akiyks@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=2dsVRGrptvNiFs+rVGyvIvenGo8f+iaXjVj2fFKyXUQ=;
        b=rNoKgxg7ASdHG/YVbc8Gtjw1aHZrUk2H19B+B63psCoBpFsnUmZWmpBdTqZPiOqpqv
         i/d5JoFWr4BEzx6RD46LgkFj7yIDSK7ukL0NE8nAbjBFquU6nzA+trmn4AIfDPxXMne5
         s0xUVsT0hvMytPmnNr/bg7yEcSnSGgX+P6FlZBFcrAFTfeInoqlWrUo9+Jq2tirVkPw4
         QZxFEF+BDftyGS4zWo0CENxX6sIhLj960meNqp1m+nUGmjdPMvnfQOzDbgR/UAD4ci8z
         ktcJ6ZhxAnOTCiOlbYElDLeY8xkHrSW4K2LUtvo9yVA821CZtn845tvedyToxvlF+lyU
         hWdw==
Subject: Re: [PATCH] count: Include atomic_nehalem.pdf instead of
 atomic_nehalem.png
References: <38fa0336-1150-7e92-bc00-b094b959f932@gmail.com>
 <482c35de-949b-9bb1-4d96-dd6972ee3430@gmail.com>
From: Akira Yokosawa <akiyks@gmail.com>
Message-ID: <9497ff28-ef07-b470-336a-859d919843e6@gmail.com>
Date: Thu, 6 Dec 2018 00:00:04 +0900
MIME-Version: 1.0
In-Reply-To: <482c35de-949b-9bb1-4d96-dd6972ee3430@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
To: "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc: perfbook@vger.kernel.org, Akira Yokosawa <akiyks@gmail.com>
List-ID: <perfbook.vger.kernel.org>

On 2018/12/05 20:56, Akira Yokosawa wrote:
> On 2018/12/05 20:00, Akira Yokosawa wrote:
>> From 213fcdaabb6daa14c1c6cfc6ff780d023478d59f Mon Sep 17 00:00:00 2001
>> From: Akira Yokosawa <akiyks@gmail.com>
>> Date: Wed, 5 Dec 2018 19:48:32 +0900
>> Subject: [PATCH] count: Include atomic_nehalem.pdf instead of atomic_nehalem.png
>>
>> Without any suffix specified, \includegraphics{} prefers .png to .pdf
>> by default.
>>
>> Fixes: 04e270767c34 ("count: Restore 'fig:count:Atomic Increment Scalability on Nehalem'")
>> Signed-off-by: Akira Yokosawa <akiyks@gmail.com>
>> ---
>> Hi Paul,
>>
>> This is a "minor fix".  Obviously, I missed to check the restored figure
>> before submitting the previous patch set. ;-)
> 
> Looks like this depends on TeX Live version. .png was included on
> Ubuntu Trusty's TeX Live 2013/Debian.
> 
> On Ubuntu Bionic (TeX Live 2017/Debian), .pdf is included both with and

The difference comes from the version of grfext, [2010/08/19 v1.1] and
[2016/05/16 v1.2].

In v1.1, the preference list is defined as:

    [.png,.pdf,.jpg,.mps,.jpeg,.jbig2,.jb2,.PNG,.PDF,.JPG,.JPEG,.JBIG2,.JB2,.eps]

In v1.2, it is defined as:

    [.pdf,.png,.jpg,.mps,.jpeg,.jbig2,.jb2,.PDF,.PNG,.JPG,.JPEG,.JBIG2,.JB2,.eps]

This means .png has a higher preference on Ubuntu Xenial, too.

JFYI.

        Thanks, Akira

> without this fix.
> 
>         Thanks, Akira
> 
>>
>>         Thanks, Akira
>> --
>>  count/count.tex | 2 +-
>>  1 file changed, 1 insertion(+), 1 deletion(-)
>>
>> diff --git a/count/count.tex b/count/count.tex
>> index 6fd54b5..bdbc4cd 100644
>> --- a/count/count.tex
>> +++ b/count/count.tex
>> @@ -248,7 +248,7 @@ accuracies far greater than 50\,\% are almost always necessary.
>>  
>>  \begin{figure}[tb]
>>  \centering
>> -\resizebox{2.5in}{!}{\includegraphics{CodeSamples/count/atomic_nehalem}}
>> +\resizebox{2.5in}{!}{\includegraphics{CodeSamples/count/atomic_nehalem.pdf}}
>>  \caption{Atomic Increment Scalability on Nehalem}
>>  \label{fig:count:Atomic Increment Scalability on Nehalem}
>>  \end{figure}
>>
> 

