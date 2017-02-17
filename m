Return-Path: <ablacktshirt@gmail.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;        d=gmail.com;
 s=20161025;        h=subject:to:references:cc:from:message-id:date:user-agent
 :mime-version:in-reply-to:content-transfer-encoding;
 bh=qpFoMADff9RqIY1ptj2rFTOtNYcbgUyXUdHFdgG9SjM=;
 b=QClAcKEw97nZ1djtTmx0v4bFlNrlt+N3q6CbQcTlPPw4uneW6+Cg3WAsDEqbvUX/9r
 HsUe+9P+rYNAw53LR97djsoRvJvZmpdmlKt6sdStszYjSHOBIbRolaLVvbcSQyWDxzWr
 WlmgoeHvGblStlMkw1FbrTT6AIUkAgZW/HY95MqaF3nZlj8PvQjjlEF4grILC/dAIwP9
 Lwdx8aCYYU49XL7axxOjP76iMJE4wHXPlxyifNnceojwcNlAdm9ideyFs/oKuSmdmLEe
 f1A6spWptKnNrfyJM3K2zJfGy3SKuwbvO5bKc/pWF+gg2aEKc9xuuoKc0jNgCh6fwOM+
 NFvw==
Subject: Re: build fail on ubuntu 16.04 LTS
References: <b8c743ec-4415-86d3-a580-def8b4051a5d@gmail.com>
 <6e48f846-88fb-631f-05ba-6d72fcb63ca6@gmail.com>
 <20c285a2-4dd3-2902-42a8-c35836cbc5a2@gmail.com>
 <b6c259aa-a855-bde6-4c0a-826a0cad018a@gmail.com>
From: Yubin Ruan <ablacktshirt@gmail.com>
Message-ID: <2743a1dc-8085-1950-1a71-1f7ad1e72a89@gmail.com>
Date: Sat, 18 Feb 2017 00:16:32 +0800
MIME-Version: 1.0
In-Reply-To: <b6c259aa-a855-bde6-4c0a-826a0cad018a@gmail.com>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
To: Akira Yokosawa <akiyks@gmail.com>
Cc: paulmck@linux.vnet.ibm.com, perfbook@vger.kernel.org
List-ID: <perfbook.vger.kernel.org>

On 2017年02月17日 23:58, Akira Yokosawa wrote:
> On 2017/02/17 23:40 +0800, Yubin Ruan wrote:
>>
>>
>> On 2017年02月17日 23:13, Akira Yokosawa wrote:
>>> On 2017/02/17 22:45:04 +0800, Yubin Ruan wrote:
>>>> The build script fail with
>>>>
>>>>     pdflatex 1 for perfbook.pdf
>>>>     ----- Fatal latex error, see perfbook.log for details. -----
>>>>     Makefile:83: recipe for target 'perfbook.aux' failed
>>>>     make: *** [perfbook.aux] Error 1
>>>>
>>>> I have attached the `perfbook.log' file.
>>>
>>> Hi Rubin,
>>>
>>> The build failed because LaTeX style file "couriers.sty" is not found
>>> in your TeX Live environment. It is logged near the end of the log file.
>>>
>>>> ! LaTeX Error: File `couriers.sty' not found.
>>>
>>> Please refer to item 5 in FAQ-BUILD.txt for necessary packages on Ubuntu.
>>> It mentions Trusty, but the same packages will do on Xenial.
>>>
>>>>
>>>> In addition, it keep complaining like
>>>>   "WARNING: Refer to utilities/mpostcheck.sh for texmf config fix."
>>>> What is going on?
>>>
>>> Well, as the message says, instruction to plug the potential vulnerability
>>> in TeX configuration can be found in the header of utilities/mpostcheck.sh.
>>>
>>> Hope this would help you.
>>>
>>>                                Thanks, Akira
>>>>
>>
>> I have install all the packages mentioned at item 5 of FAQ-BUILD.txt
>> But there are still build errors. I have attached the log file
>>
> 
> Well, I've never seen this error:
> 
>> ! LaTeX Error: Something's wrong--perhaps a missing \item.
> 
> What happens if you do "make clean; make"?
> 
>                                   Thanks, Akira
> 

Yes, `make clean' works. And I have fix that warning according to
Akira's suggestion

regards,
Yubin Ruan

