Return-Path: <bsingharora@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20120113;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=HQ76MGn2U1Hc48mhcjV9ix8z2E3jfLi8t5O788876rk=;
 b=GHxY+CgyI9GbJv6LL9S5zYEERNDDnL/V1YVhvnUGpylOSOqksBRdfITDRbWZD/acv2
 D2hebDMtSBNMDVsfOMOqiIWyFnkKSx3HLy8K7eWrYyxciJEGbs+DDCke3B9IV/WUIlDQ
 q928EbJcxLr4aHuCOZ7NkPCKFSOERXd2zbCUDo7MnDn4bq0BkxPA7xoRIu8Xa76iYTuo
 ft6FYEkPIzS2JFLCJ6a+27yGwzveCaziAEgZgs7nTWyfXSQioKJTsyXCvZzytO3Bs+Br
 5NQmYCCO6sxIkd9YEApxTb2s08ghGW5p8c6EQSr1UsXe/MxK7QxKWDdNGeLsFDcWJUTk
 W9mQ==
Subject: Re: Memory barrier -- fix sample code
References: <1470097946.3000.3.camel@gmail.com>
 <20160802040204.GY3482@linux.vnet.ibm.com>
 <1470125114.3000.7.camel@gmail.com>
 <8a09ce4e-0ed6-bf0e-8941-f7c539b0f6f4@gmail.com>
From: Balbir Singh <bsingharora@gmail.com>
Message-ID: <fc9c9ca5-cbc1-b734-a5a6-69af3aeb8b24@gmail.com>
Date: Mon, 8 Aug 2016 14:58:59 +1000
MIME-Version: 1.0
In-Reply-To: <8a09ce4e-0ed6-bf0e-8941-f7c539b0f6f4@gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@linux.vnet.ibm.com, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>



On 02/08/16 22:09, Akira Yokosawa wrote:
> On 2016/08/02 18:05:14 +1000, Balbir Singh wrote:
>> On Mon, 2016-08-01 at 21:02 -0700, Paul E. McKenney wrote:
>>> On Tue, Aug 02, 2016 at 10:32:26AM +1000, Balbir Singh wrote:
>>>>  
>>>> From: Balbir singh <bsingharora@gmail.com>
>>>> Date: Tue, 2 Aug 2016 10:26:34 +1000
>>>> Subject: [PATCH] Correct a sample in memorybarriers.tex
>>>>  
>>>> We probably don't want to show GFP_KERNEL allocation
>>>> under spin_lock, GFP_ATOMIC seems much better.
>>>>  
>>>> Signed-off-by: Balbir singh <bsingharora@gmail.com>
>>> Good catch, applied, thank you!
>>>  
>>> However, I had to apply this by hand due to some recent mass changes to
>>> figures containing code.  Could you please move to current perfbook.git
>>> for future submissions?
>>>  
>>>  							Thanx, Paul
>>
>> I thought I did a git pull before patching.
>>
>> My git-head pointed to 413b7bc1cf6d65368300e96016ac15ac728b66fd
>>
>> I'll double check. Thanks for applying it by hand
>>
> 
> Hi,
> 
> Seems like a problem of character encoding.
> 
> I see you are using Evolution.
> Here is an excerpt from Linux's Documentation/email-clients.txt.
> 


Yes, I do have flow-off and I use an external editor to prevent white
space damage. Thanks, I'll double check my editor settings

Balbir

