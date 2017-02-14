Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=LYteIzX39PI5yFX6NlO5A2NxTjAIGvdj3XwUyadixIA=;
 b=ZYuxIoBfX4tyfAMJaj5dhEVuNFv76y9a72bWntO3gL62wq9sR4xvfyHKdFBHpzzmvE
 0d0wJ+qvAqN+9yH1JZJAGwTTdc0fRvqFBlzc69ABDDXWmA1QbUeB1sDwf8tjErxY8mz7
 w78XLwAONyCtuJ9RaJBW1Y2eKAF2akpXyCdjgQAdvuOR+l2lySiWMhlC5KV9hl/nMayd
 tpFwkd4544pcIM77keV8v8Xc/hMpu5XKL7+8aB96UawypLHphjozDWxFS1vXM7mwKtg6
 qAnSFoKH2Nyo3JUaQSjQbGjR9cVw3HoGWy4i6YoZ+UovpWZWN836iYkTGhFdMiTOzouv
 CrNg==
Subject: Re: [Question] different kinds of memory barrier
References: <881f369d-4e5b-a335-6359-c5d7bf1bc086@gmail.com>
 <20170213190600.GJ30506@linux.vnet.ibm.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Message-ID: <79ac9a88-3f3a-5b97-940f-35210a7d9405@gmail.com>
Date: Tue, 14 Feb 2017 18:35:05 +0800
MIME-Version: 1.0
In-Reply-To: <20170213190600.GJ30506@linux.vnet.ibm.com>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
To: paulmck@linux.vnet.ibm.com
Cc: perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On 2017/2/14 3:06, Paul E. McKenney wrote:
> On Mon, Feb 13, 2017 at 09:55:50PM +0800, Yubin Ruan wrote:
>> It have been mentioned in the book that there are three kinds of
>> memory barriers: smp_rmb, smp_wmb, smp_mb
>>
>> I am confused about their actual semantic:
>>
>> The book says that(B.5 paragraph 2, perfbook2017.01.02a):
>>
>> for smp_rmb():
>>     "The effect of this is that a read memory barrier orders
>>      only loads on the CPU that executes it, so that all loads
>>      preceding the read memory barrier will appear to have
>>      completed before any load following the read memory
>>      barrier"
>>
>> for smp_wmb():
>>     "so that all stores preceding the write memory barrier will
>>      appear to have completed before any store following the
>>      write memory barrier"
>>
>> I wonder, is there any primitive "X" which can guarantees:
>>     "that all 'loads' preceding the X will appear to have completed
>>      before any *store* following the X "
>>
>> and similarly:
>>     "that all 'store' preceding the X will appear to have completed
>>      before any *load* following the X "
>>

I am reading your the material you provided.
So, there is no short answer(yes/no) to the questions above?(I mean the 
primitive X)

>> I know I can use the general smp_mb() for that, but that is a little
>> too general.
>>
>> Do I miss/mix anything ?
>
> Well, the memory-ordering material is a bit dated.  There is some work
> underway to come up with a better model, and I presented on it a couple
> weeks ago:
>
> http://www.rdrop.com/users/paulmck/scalability/paper/LinuxMM.2017.01.19a.LCA.pdf
>
> This presentation calls out a tarball that includes some .html files
> that have much better explanations, and this wording will hopefully
> be reflected in an upcoming version of the book.  Here is a direct
> URL for the tarball:
>
> http://www.rdrop.com/users/paulmck/scalability/paper/LCA-LinuxMemoryModel.2017.01.15a.tgz
>
> 							Thanx, Paul
>

regrads,
Yubin Ruan

