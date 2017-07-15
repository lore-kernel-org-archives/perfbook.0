Return-Path: <junchangwang@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;
 h=mime-version:in-reply-to:references:from:date:message-id:subject:to
 :cc;        bh=iNxSxkzoItkAqlLMDdU4YFhhXngqzwMJ7YNLWPbH4pE=;
 b=iwcCA4HfWyctaelmA/Duup9tjCPmv907YmIPXJDc5RZO8tGYw5Sxq4Xpeq8tFfy8Cs
 fRZVFlnoLJKXJjIvDFIjdxudkY7rWDcl2+XVHkhxRGvlBprWjaPY/j4EerC3Zrw/ke0J
 YEpzWp7kW/etxSxbnIbXU9iV9XRo2fGpCLQYuE/LhZ1Nvh5pXQL++msVslhw/NmT1QJ0
 HWpZpTd+O0p4sITnBHRb1b58qzjyek+vrT99MOn1jKESl1m0kHlgYFgmPPP8+O4zouYF
 5Bv7KXLhFUZmAxL0xX1BvUVO3EzaXvo+z71Lx8wxxOqMrJsnvncBifrnCs+vRsDFTheE
 gN4Q==
MIME-Version: 1.0
In-Reply-To: <95b9a42a-9da0-69c8-2e13-2e4a7facf3be@gmail.com>
References: <1500090706-6325-1-git-send-email-junchangwang@gmail.com>
 <95b9a42a-9da0-69c8-2e13-2e4a7facf3be@gmail.com>
From: Junchang Wang <junchangwang@gmail.com>
Date: Sat, 15 Jul 2017 15:18:04 +0800
Message-ID: 
 <CABoNC80kBwTxa-Tx4YO07y676=PttY=QAvYecMH6Nt1wVuTftw@mail.gmail.com>
Subject: Re: [PATCH] Advsync: fix typos
Content-Type: text/plain; charset="UTF-8"
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
List-ID: <perfbook.vger.kernel.org>

Hi Akira,



On Sat, Jul 15, 2017 at 1:20 PM, Akira Yokosawa <akiyks@gmail.com> wrote:
> Hi Jason,
>
> On 2017/07/15 11:51:46 +0800, Junchang Wang wrote:
>> Hi Paul,
>>
>> I have read through Chapter Advance Synchronization, and following are two
>> typos. Please take a look. Thanks for this excellent book!
>>
>> Signed-off-by: Junchang Wang <junchangwang@gmail.com>
>> ---
>>  advsync/memorybarriers.tex | 4 ++--
>>  1 file changed, 2 insertions(+), 2 deletions(-)
>>
>> diff --git a/advsync/memorybarriers.tex b/advsync/memorybarriers.tex
>> index c9c975c..009dc6e 100644
>> --- a/advsync/memorybarriers.tex
>> +++ b/advsync/memorybarriers.tex
>> @@ -950,7 +950,7 @@ thereby forcing the required ordering on all platforms.
>>  \label{fig:advsync:S Address-Dependency Litmus Test}
>>  \end{figure}
>>
>> -But suppose that the dependent operation is a write rather than
>> +But what happens if the dependent operation is a write rather than
>>  a read, for example, in the \emph{S}
>>  litmus test~\cite{JadeAlglave2011ppcmem} shown in
>>  Figure~\ref{fig:advsync:S Address-Dependency Litmus Test}?
>> @@ -2511,7 +2511,7 @@ Failure to follow this rule can have serious side effects:
>>       In theory, yes, you could load an integer, perhaps to use
>>       it as an array index.
>>       In practice, the compiler knows too much about integers,
>> -     and thus has way too many opportunities to break your
>> +     and thus has too many opportunities to break your
>
> This "way" is an adverb for emphasizing. It might sound colloquial
> but it's the tone in perfbook. So I would NAK this hunk.
>

Thanks a lot for the explanation!

> Also, the format of this message would result in your greetings being
> included in the commit log if it were applied as is.
> It would be better if you put the greetings between "---" and diff stat.
>
> For the 1st hunk, I would suggest a commit title something like:
>
>     advsync: Rephrase question as such
>
> Can you try a respin with the following tag?
>

Sure. I can resend a new patch soon.


Thanks,
--Jason

> Suggested-by: Akira Yokosawa <akiyks@gmail.com>
>
>       Thanks, Akira
>
>>       dependency chain.
>>  \end{enumerate}
>>
>>
>

