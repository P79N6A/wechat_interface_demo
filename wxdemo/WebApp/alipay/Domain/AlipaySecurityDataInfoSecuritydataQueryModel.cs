using System;
using System.Xml.Serialization;

namespace Aop.Api.Domain
{
    /// <summary>
    /// AlipaySecurityDataInfoSecuritydataQueryModel Data Structure.
    /// </summary>
    [Serializable]
    public class AlipaySecurityDataInfoSecuritydataQueryModel : AopObject
    {
        /// <summary>
        /// 业务代码,描述数据查询所属的具体业务模块.例如黑名单业务,地理信息数据.
        /// </summary>
        [XmlElement("biz_id")]
        public string BizId { get; set; }

        /// <summary>
        /// 扩展参数,用于业务扩展入参,格式为json.注意由于嵌套在入参json中,引号需要转义,详见入参样式.
        /// </summary>
        [XmlElement("ext")]
        public string Ext { get; set; }

        /// <summary>
        /// 查询的主体值,例如身份证号: "210100197210019087",支持单个或者多个,多个以逗号分隔.
        /// </summary>
        [XmlElement("subject")]
        public string Subject { get; set; }

        /// <summary>
        /// 系统维度,系统名 , 例如: MS0001  MS表示民生银行, 0001表示民生银行的内部需求方代码,当民生银行有多个部门需要划分时,可以有MS0002, MS0003
        /// </summary>
        [XmlElement("system_name")]
        public string SystemName { get; set; }

        /// <summary>
        /// 查询参数类型,以黑名单业务为例:  bank_card_no,银行卡号、  cert_no,身份证号码、  business_license_no,营业执照号码、  company_name, 公司名称，  phone,预留手机号
        /// </summary>
        [XmlElement("type")]
        public string Type { get; set; }
    }
}
