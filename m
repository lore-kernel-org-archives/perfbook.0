Received: from out-181.mta0.migadu.com (out-181.mta0.migadu.com [91.218.175.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 370CA27603F
	for <perfbook@vger.kernel.org>; Fri, 28 Feb 2025 17:34:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740764054; cv=none; b=KJ63Bggr3mHdoqKEovDRyCHlaTcIUgQPvjVVhun2x4Oe212zjP6064bYjmebn56RI3GjkUmqQjsqtnP9n8DTuyFExwiH+0e7rBYtW48k+vtf/91iB5bhbmMn688+z30MpOjU+GmRbW++5AmXTnpUvAixAcAtpGrPkxgBZN+x7ZY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740764054; c=relaxed/simple;
	bh=HEEByey7/GNDgjRW2vtDYbp72mW7YrrzD7MQWVSeZXM=;
	h=Message-ID:Date:MIME-Version:Subject:From:To:References:
	 In-Reply-To:Content-Type; b=nuXH5FPADFJ/8KyYs/+zaitjnds5p/Cude1F3LU6G//ffRFCXPnul8GVn0t4IJSWzK9lL/bVciOL86VEPwJAbSLu2M89b2jdkkGAY7C7CMndEXvkOFuEwF0YHWhb2RbAvvLqDOmym6wEMIG+KJrwuGYBwYPRlP+6kQ4J6Rr3DKM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com; spf=pass smtp.mailfrom=iencinas.com; dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b=jTP3yEEu; arc=none smtp.client-ip=91.218.175.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=iencinas.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=iencinas.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=iencinas.com header.i=@iencinas.com header.b="jTP3yEEu"
Message-ID: <3645169d-1599-4a0a-8eb5-7452dfc8712e@iencinas.com>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iencinas.com;
	s=key1; t=1740764050;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=FGt/lf7DylGXeafd02tvI21TyDoJojy8dG5oizeZBr4=;
	b=jTP3yEEuu40r3UvpPCm8bLfRxmFaLPPiUH/XT00YVMNiypr04AQmRIe05uLIOxXaVyd+RK
	GZFZN8RfC17eGICK3khdT+W0gFpmqv5KENXx566XrbcwiMYhBky9iHTVmVaXm/UBZ7j2sk
	66vptzluuRM6Z06ohMmqr6hVvuF1HmHuSn67TOhCU8QU45Bs2t6UIy7ZaEfzHQm4L0nfT6
	EKhGr5ZFlrgpCZgI99x1jiFxPkPqsWMejOB8qrKnwFosYc54hKnKBEgcajW33nzRZuZvzq
	R4iLLj8/zbEoiJx9iKSkQ+Rm7QZiahGFl8dB1ilImKT1NQTyhmafVv2yFWduqQ==
Date: Fri, 28 Feb 2025 18:34:06 +0100
Precedence: bulk
X-Mailing-List: perfbook@vger.kernel.org
List-Id: <perfbook.vger.kernel.org>
List-Subscribe: <mailto:perfbook+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:perfbook+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: Is Alpha non-other-multicopy atomic?
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ignacio Encinas Rubio <ignacio@iencinas.com>
To: perfbook@vger.kernel.org
References: <6c2c3199-e092-4909-853e-4fad1ca0f35c@iencinas.com>
Content-Language: en-US
In-Reply-To: <6c2c3199-e092-4909-853e-4fad1ca0f35c@iencinas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 28/2/25 18:31, Ignacio Encinas Rubio wrote:
> [3] Documents ARM's adoption of other-multicopy atomicity, using POWER as an example of 
> non-other-multicopy-atomicity but fails to mention Alpha.

Not [3] but https://dl.acm.org/doi/pdf/10.1145/3158107. Last minute
edit, sorry!
