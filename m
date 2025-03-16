Received: from out-189.mta0.migadu.com (out-189.mta0.migadu.com [91.218.175.189])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EC1132C8B
	for <perfbook@vger.kernel.org>; Sun, 16 Mar 2025 17:12:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.189
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742145157; cv=none; b=LV0ZdOCJFwN7YYozc3pm7/o4yLLpSGlXhF9n2vcax/TkPlME57A4WabaAXPsLSGdf0GQdBPBvCUQKXjHHi2ShQxc2tSyBKa7ZHD/zidKRKhMEAQDmB5A5dxRrBM0RF7Z0K7LXcG7CioPIrgU34ZCKQjgviK1x5gxSc52EgDGayY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742145157; c=relaxed/simple;
	bh=C59jo72SXsAxUcrZg8lBX0LaXT2e3dZdZm89dpH2W8M=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=maDBG0Fh9GMbfmQVHG8NiwCBjpmLJfL6KzKvAsqIViic+nSBGlAEgPv59T/P7yhNI9VxOHfuMReXb9K7XBAmuCFLSnrwbngyCcCAjqqa4e8+8Itjy9A8Q9BNgNDa+idV3mBmIPPdrrIU04dVv+91hThjjUJXz3CVKEoqd9r7+0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com; spf=pass smtp.mailfrom=iencinas.com; dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b=NYPBl0uX; arc=none smtp.client-ip=91.218.175.189
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iencinas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b="NYPBl0uX"
Message-ID: <03f234c4-faac-49ef-8956-2bf04579eab7@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1742145152;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references:autocrypt:autocrypt;
	bh=XI7icQNNvgcHDJdFHkdIrklFm0qlpl4UpJNVMY8AnGY=;
	b=NYPBl0uXK45r5/OWgxlGPaqqJVUSWQwRegOhx+cbDcrimZc5PKH+uE1F+CKuajaXgacmdY
	IXUvF4CbbxJ3zLHtB+inPA27hwmUlG6LSL/TbDE/UV5gY4YzGvtytb5oyOZlMiwT6CjgyA
	BIrh1G9IvFE9Y4/ONMoP+RjHkkZ/L7eT5lIYtnyPXkPpxKHgecLw2PkPK466e3S1LBIyrI
	isOLqPcivPFHDKqCvT+fn6J+geCbXYiJan2nnZgJEaaw2v22s9TUG3c8Q/MUnn+uoEQd43
	JxXkha59tCCumywX9sopz7ppd+dF6yM0FRlVCDZn0saI3yNNTVuZsyXp+YD9+w==
Date: Sun, 16 Mar 2025 18:12:29 +0100
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Is Alpha non-other-multicopy atomic?
To: Akira Yokosawa <akiyks@gmail.com>
Cc: perfbook@vger.kernel.org, "Paul E. McKenney" <paulmck@kernel.org>
References: <6c2c3199-e092-4909-853e-4fad1ca0f35c@iencinas.com>
 <64509d29-0593-4b7b-bb29-8a96835ac1bc@gmail.com>
Content-Language: en-US
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
Autocrypt: addr=ignacio@iencinas.com; keydata=
 xjMEZgaZEBYJKwYBBAHaRw8BAQdAYZxeXU5yoeLYkQpvN+eE3wmAF4V0JUzIlpm/DqiSeBnN
 LElnbmFjaW8gRW5jaW5hcyBSdWJpbyA8aWduYWNpb0BpZW5jaW5hcy5jb20+wo8EExYIADcW
 IQSXV5vKYfM26lUMmYnH3J3Ka8TsNgUCZgaZEAUJBaOagAIbAwQLCQgHBRUICQoLBRYCAwEA
 AAoJEMfcncprxOw21F4BAJe+mYh3sIdSvydyDdDXLFqtVkzrFB8PVNSU9eZpvM0mAP9996LA
 N0gyY7Obnc3y59r9jOElOn/5fz5mOEU3nE5lCc44BGYGmRESCisGAQQBl1UBBQEBB0CVC5o6
 qnsTzmmtKY1UWa/GJE53dV/3UPJpZu42p/F0OAMBCAfCfgQYFggAJhYhBJdXm8ph8zbqVQyZ
 icfcncprxOw2BQJmBpkRBQkFo5qAAhsMAAoJEMfcncprxOw2N8ABAPcrkHouJPn2N8HcsL4S
 SVgqxNLVOpsMX9kAYgIMqM0WAQCA40v0iYH1q7QHa2IfgkrBzX2ZLdXdwoxfUr8EY5vtAg==
In-Reply-To: <64509d29-0593-4b7b-bb29-8a96835ac1bc@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 16/3/25 12:37, Akira Yokosawa wrote:
> As is well known, Alpha is infamous of its lack of address-dependency
> guarantees.  I don't see much point in discussing whether it is multicopy
> atomic or not.

I agree this is not particularly important, I just found contradicting
information and wanted to clarify/fix Table 15.5.

> If you have access to an Alpha machine with 3 or more CPUs,
> you should be able to run this test with the help of klitmus7.

Thanks for the test. Sadly, I don't have access to an Alpha CPU (I was
born after DEC was bought by Compaq)

> Finally, my mental model of other-multi-copy might be different from
> those defined in papers you cited below. 

Might be, I have just realized mine is wrong. I have just run Listing 
15.16 (C-WRC...) in herd using the "linux" model to realize the exists
clause can trigger. 

Note that it can do so while "RFE" imposes order for the "linux" model 
(it is part of happens-before), so my original comment stating 

  non-mca == rfe does not impose order 

is wrong if Read[X = 0] (fr) -> Write[X = 1] does not mean that the read
is ordered before the write. However, this doesn't seem to be the case
for Alpha [3]

  Section 5.6.1.2: The ordering relation Before (<=) is acyclic
  Section 5.6.1.4: If u and v are overlapping read/write accesses, at
    least one of which is a write, then u and v must be comparable in 
    the BEFORE (<=) ordering, that is, either u <= v or v <= u.

It's still my opinion that Alpha is other-multi-copy atomic but I
understand it is a bit pointless to discuss about this... Sorry, I
couldn't resist.

Thanks

[3] https://download.majix.org/dec/alpha_arch_ref.pdf


