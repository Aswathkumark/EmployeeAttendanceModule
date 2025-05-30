<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="EmployeeAttendance.aspx.cs" Inherits="EmployeeAttendanceModule.EmployeeAttendance" %>
<%@ Register Assembly="Microsoft.ReportViewer.WebForms" Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Employee Attendance Portal</title>
    <!-- Bootstrap 5.3.3 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet" />
    <style>
       /* Classical Futuristic CSS for Employee Attendance System */

@import url('https://fonts.googleapis.com/css2?family=Orbitron:wght@400;700;900&family=Rajdhani:wght@300;400;600;700&display=swap');

:root {
    /* Classical Futuristic Color Palette */
    --primary-gold: #d4af37;
    --primary-blue: #0a1628;
    --accent-cyan: #00d4ff;
    --accent-purple: #6366f1;
    --dark-navy: #0f172a;
    --light-gold: #f7e7a1;
    --glass-white: rgba(255, 255, 255, 0.1);
    --glass-blue: rgba(10, 22, 40, 0.8);
    --neon-glow: #00ffff;
    --classical-marble: #f8f9fa;
    
    /* Gradients */
    --classical-gradient: linear-gradient(135deg, #0a1628 0%, #1e293b 50%, #334155 100%);
    --gold-gradient: linear-gradient(45deg, #d4af37, #f7e7a1, #d4af37);
    --cyber-gradient: linear-gradient(45deg, #00d4ff, #6366f1, #8b5cf6);
    --glass-gradient: linear-gradient(145deg, rgba(255,255,255,0.1), rgba(255,255,255,0.05));
}

/* Base Styles */
body {
    background: var(--classical-gradient);
    font-family: 'Rajdhani', sans-serif;
    color: var(--classical-marble);
    margin: 0;
    padding: 0;
    min-height: 100vh;
    position: relative;
    overflow-x: hidden;
}

/* Animated Background */
body::before {
    content: '';
    position: fixed;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: 
        radial-gradient(circle at 20% 20%, rgba(212, 175, 55, 0.1) 0%, transparent 50%),
        radial-gradient(circle at 80% 80%, rgba(0, 212, 255, 0.1) 0%, transparent 50%),
        radial-gradient(circle at 40% 60%, rgba(99, 102, 241, 0.05) 0%, transparent 50%);
    animation: backgroundShift 20s ease-in-out infinite;
    z-index: -1;
}

@keyframes backgroundShift {
    0%, 100% { opacity: 0.3; }
    50% { opacity: 0.6; }
}

/* Container */
.container {
    max-width: 1400px;
    position: relative;
    z-index: 1;
}

/* Classical Futuristic Cards */
.form-section,
.gridview-container,
#reportContainer {
    background: var(--glass-gradient);
    backdrop-filter: blur(20px);
    border: 1px solid rgba(212, 175, 55, 0.3);
    border-radius: 20px;
    padding: 2.5rem;
    margin: 2rem 0;
    box-shadow: 
        0 8px 32px rgba(0, 0, 0, 0.3),
        inset 0 1px 0 rgba(255, 255, 255, 0.2),
        0 0 50px rgba(212, 175, 55, 0.1);
    position: relative;
    overflow: hidden;
}

/* Card Corner Accents */
.form-section::before,
.gridview-container::before,
#reportContainer::before {
    content: '';
    position: absolute;
    top: 0;
    left: 0;
    width: 60px;
    height: 60px;
    background: var(--gold-gradient);
    clip-path: polygon(0 0, 100% 0, 0 100%);
    opacity: 0.7;
}

.form-section::after,
.gridview-container::after,
#reportContainer::after {
    content: '';
    position: absolute;
    bottom: 0;
    right: 0;
    width: 60px;
    height: 60px;
    background: var(--cyber-gradient);
    clip-path: polygon(100% 0, 100% 100%, 0 100%);
    opacity: 0.7;
}

/* Section Titles */
h2.section-title {
    font-family: 'Orbitron', monospace;
    font-size: 2.2rem;
    font-weight: 700;
    background: var(--gold-gradient);
    -webkit-background-clip: text;
    -webkit-text-fill-color: transparent;
    background-clip: text;
    text-align: center;
    margin-bottom: 2rem;
    position: relative;
    text-transform: uppercase;
    letter-spacing: 3px;
}

h2.section-title::after {
    content: '';
    position: absolute;
    bottom: -10px;
    left: 50%;
    transform: translateX(-50%);
    width: 100px;
    height: 3px;
    background: var(--gold-gradient);
    border-radius: 2px;
    box-shadow: 0 0 10px var(--primary-gold);
}

/* Form Labels */
.form-label {
    font-family: 'Orbitron', monospace;
    font-weight: 600;
    color: var(--light-gold);
    font-size: 0.95rem;
    text-transform: uppercase;
    letter-spacing: 1px;
    margin-bottom: 0.5rem;
    display: block;
}

/* Form Controls */
.form-control {
    background: rgba(255, 255, 255, 0.05);
    border: 2px solid rgba(212, 175, 55, 0.3);
    border-radius: 12px;
    color: var(--classical-marble);
    padding: 12px 16px;
    font-family: 'Rajdhani', sans-serif;
    font-size: 1.1rem;
    font-weight: 400;
    transition: all 0.3s ease;
    backdrop-filter: blur(10px);
}

.form-control:focus {
    background: rgba(255, 255, 255, 0.1);
    border-color: var(--accent-cyan);
    box-shadow: 
        0 0 0 0.2rem rgba(0, 212, 255, 0.25),
        0 0 20px rgba(0, 212, 255, 0.3),
        inset 0 1px 0 rgba(255, 255, 255, 0.1);
    color: white;
    outline: none;
}

.form-control::placeholder {
    color: rgba(248, 249, 250, 0.6);
    font-style: italic;
}

/* Buttons */
.btn {
    font-family: 'Orbitron', monospace;
    font-weight: 600;
    text-transform: uppercase;
    letter-spacing: 1px;
    padding: 12px 24px;
    border-radius: 25px;
    border: none;
    position: relative;
    overflow: hidden;
    transition: all 0.3s ease;
    cursor: pointer;
    box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
}

.btn::before {
    content: '';
    position: absolute;
    top: 0;
    left: -100%;
    width: 100%;
    height: 100%;
    background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
    transition: left 0.5s;
}

.btn:hover::before {
    left: 100%;
}

/* Primary Button */
.btn-primary {
    background: var(--cyber-gradient);
    color: white;
    box-shadow: 0 0 20px rgba(0, 212, 255, 0.3);
}

.btn-primary:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 25px rgba(0, 212, 255, 0.4);
}

/* Success Button */
.btn-success {
    background: linear-gradient(45deg, #22c55e, #16a34a);
    color: white;
    box-shadow: 0 0 20px rgba(34, 197, 94, 0.3);
}

.btn-success:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 25px rgba(34, 197, 94, 0.4);
}

/* Warning Button */
.btn-warning {
    background: var(--gold-gradient);
    color: var(--dark-navy);
    box-shadow: 0 0 20px rgba(212, 175, 55, 0.3);
}

.btn-warning:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 25px rgba(212, 175, 55, 0.4);
}

/* Secondary Button */
.btn-secondary {
    background: linear-gradient(45deg, #64748b, #475569);
    color: white;
    box-shadow: 0 0 20px rgba(100, 116, 139, 0.3);
}

.btn-secondary:hover {
    transform: translateY(-2px);
    box-shadow: 0 6px 25px rgba(100, 116, 139, 0.4);
}

/* Outline Buttons */
.btn-outline-primary {
    background: transparent;
    border: 2px solid var(--accent-cyan);
    color: var(--accent-cyan);
}

.btn-outline-primary:hover {
    background: var(--accent-cyan);
    color: var(--dark-navy);
    box-shadow: 0 0 20px rgba(0, 212, 255, 0.4);
}

.btn-outline-info {
    background: transparent;
    border: 2px solid var(--accent-purple);
    color: var(--accent-purple);
}

.btn-outline-info:hover {
    background: var(--accent-purple);
    color: white;
    box-shadow: 0 0 20px rgba(99, 102, 241, 0.4);
}

.btn-outline-danger {
    background: transparent;
    border: 2px solid #ef4444;
    color: #ef4444;
}

.btn-outline-danger:hover {
    background: #ef4444;
    color: white;
    box-shadow: 0 0 20px rgba(239, 68, 68, 0.4);
}

/* Table Styles */
.table {
    background: transparent;
    color: var(--classical-marble);
    border-radius: 15px;
    overflow: hidden;
    box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
}

.table thead th {
    background: var(--gold-gradient);
    color: var(--dark-navy);
    font-family: 'Orbitron', monospace;
    font-weight: 700;
    text-transform: uppercase;
    letter-spacing: 1px;
    border: none;
    padding: 15px;
    font-size: 0.9rem;
}

.table tbody tr {
    background: rgba(255, 255, 255, 0.05);
    backdrop-filter: blur(10px);
    border-bottom: 1px solid rgba(212, 175, 55, 0.2);
    transition: all 0.3s ease;
}

.table tbody tr:hover {
    background: rgba(0, 212, 255, 0.1);
    transform: scale(1.01);
    box-shadow: 0 4px 15px rgba(0, 212, 255, 0.2);
}

.table tbody td {
    border: none;
    padding: 15px;
    font-weight: 400;
    vertical-align: middle;
}

/* Message Labels */
.text-danger {
    color: #ff6b6b !important;
    font-weight: 600;
    text-shadow: 0 0 10px rgba(255, 107, 107, 0.5);
}

/* Button Container Fixes */
.d-flex.gap-2 {
    display: flex !important;
    gap: 0.5rem !important;
    flex-wrap: wrap !important;
}

.d-flex.gap-2 .btn {
    flex: 1 1 auto;
    min-width: fit-content;
    white-space: nowrap;
    overflow: visible;
}

/* Ensure button containers have proper width */
.col-md-3.d-flex.gap-2 {
    min-width: 280px;
}

/* Fix for button group in search section */
.row.g-3.align-items-end .col-md-3 {
    display: flex;
    flex-direction: column;
    gap: 0.5rem;
}

.row.g-3.align-items-end .col-md-3 .d-flex {
    width: 100%;
    justify-content: space-between;
}

/* Responsive Design */
@media (max-width: 768px) {
    .form-section,
    .gridview-container,
    #reportContainer {
        padding: 1.5rem;
        margin: 1rem 0;
    }
    
    h2.section-title {
        font-size: 1.8rem;
        letter-spacing: 2px;
    }
    
    .btn {
        padding: 10px 20px;
        font-size: 0.9rem;
    }
    
    /* Mobile button fixes */
    .col-md-3.d-flex.gap-2 {
        min-width: 100%;
        margin-top: 1rem;
    }
    
    .d-flex.gap-2 .btn {
        flex: 1;
        min-width: 80px;
    }
    
    .row.g-3.align-items-end .col-md-3 .d-flex {
        flex-direction: column;
        gap: 0.5rem;
    }
    
    .row.g-3.align-items-end .col-md-3 .d-flex .btn {
        width: 100%;
    }
}

@media (max-width: 992px) {
    .col-md-3.d-flex.gap-2 {
        min-width: 100%;
        margin-top: 1rem;
    }
}

/* Custom Scrollbar */
::-webkit-scrollbar {
    width: 12px;
}

::-webkit-scrollbar-track {
    background: var(--dark-navy);
    border-radius: 10px;
}

::-webkit-scrollbar-thumb {
    background: var(--gold-gradient);
    border-radius: 10px;
    box-shadow: 0 0 10px rgba(212, 175, 55, 0.5);
}

::-webkit-scrollbar-thumb:hover {
    background: var(--cyber-gradient);
    box-shadow: 0 0 15px rgba(0, 212, 255, 0.5);
}

/* Animation for page load */
@keyframes fadeInUp {
    from {
        opacity: 0;
        transform: translateY(30px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.form-section,
.gridview-container,
#reportContainer {
    animation: fadeInUp 0.8s ease-out;
}

/* Glowing text effect for important elements */
.glow-text {
    text-shadow: 0 0 10px currentColor;
}

/* Special effects for interactive elements */
.form-control:focus,
.btn:hover,
.table tbody tr:hover {
    position: relative;
    z-index: 1;
}

/* Neo-classical border pattern */
.classical-border {
    border-image: linear-gradient(45deg, var(--primary-gold), var(--accent-cyan), var(--primary-gold)) 1;
}

/* Futuristic input group enhancements */
.input-group {
    position: relative;
}

.input-group::after {
    content: '';
    position: absolute;
    bottom: -2px;
    left: 0;
    height: 2px;
    width: 0;
    background: var(--cyber-gradient);
    transition: width 0.3s ease;
}

.input-group:focus-within::after {
    width: 100%;
}
    </style>
</head>
<body>
    <div class="floating-shapes">
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <div class="loading-spinner" id="loadingSpinner">
        <div class="spinner"></div>
    </div>

    <form id="form1" runat="server" class="py-4">
        <asp:ScriptManager ID="ScriptManager1" runat="server" />
        <div class="container card-hover">

            <!-- Form Section -->
            <div class="form-section">
                <h2 class="section-title">
                    <i class="fas fa-user-clock"></i>
                    Employee Attendance Portal
                </h2>

                <asp:Label ID="lblMessage" runat="server" CssClass="success-message d-block" Visible="false" />

                <div class="row g-4 mb-4">
                    <div class="col-md-6">
                        <asp:Label Text="👤 Employee ID:" AssociatedControlID="txtEmployeeID" runat="server" CssClass="form-label" />
                        <asp:TextBox ID="txtEmployeeID" runat="server" CssClass="form-control" placeholder="Enter employee ID..." />
                    </div>
                    <div class="col-md-6">
                        <asp:Label Text="📝 Employee Name:" AssociatedControlID="txtEmployeeName" runat="server" CssClass="form-label" />
                        <asp:TextBox ID="txtEmployeeName" runat="server" CssClass="form-control" placeholder="Enter full name..." />
                    </div>
                </div>

                <div class="row g-4 mb-4">
                    <div class="col-md-4">
                        <asp:Label Text="📅 Date:" AssociatedControlID="txtDate" runat="server" CssClass="form-label" />
                        <asp:TextBox ID="txtDate" runat="server" TextMode="Date" CssClass="form-control" />
                    </div>
                    <div class="col-md-4">
                        <asp:Label Text="🕐 Time In:" AssociatedControlID="txtTimeIn" runat="server" CssClass="form-label" />
                        <asp:TextBox ID="txtTimeIn" runat="server" Placeholder="HH:mm" CssClass="form-control" />
                    </div>
                    <div class="col-md-4">
                        <asp:Label Text="🕕 Time Out:" AssociatedControlID="txtTimeOut" runat="server" CssClass="form-label" />
                        <asp:TextBox ID="txtTimeOut" runat="server" Placeholder="HH:mm" CssClass="form-control" />
                        <asp:CustomValidator ID="cvTimeOut" runat="server" ControlToValidate="txtTimeOut"
                            OnServerValidate="cvTimeOut_ServerValidate" CssClass="text-danger mt-2 d-block" Display="Dynamic" />
                    </div>
                </div>

                <div class="mb-4">
                    <asp:Label Text="💭 Remarks:" AssociatedControlID="txtRemarks" runat="server" CssClass="form-label" />
                    <asp:TextBox ID="txtRemarks" runat="server" TextMode="MultiLine" Rows="3" CssClass="form-control" 
                        placeholder="Add any additional notes or comments..." />
                    <asp:HiddenField ID="hiddenAttendanceID" runat="server" />
                </div>

                <div class="mb-4 d-flex gap-3 flex-wrap justify-content-center">
                    <asp:Button ID="btnSave" runat="server" Text="Save Record" CssClass="btn btn-success" OnClick="btnSave_Click" />
                    <asp:Button ID="btnUpdate" runat="server" Text="Update Record" CssClass="btn btn-warning" Visible="false" OnClick="btnUpdate_Click" />
                    <asp:Button ID="btnCancel" runat="server" Text="Cancel" CssClass="btn btn-secondary" OnClick="btnCancel_Click" />
                </div>

                <!-- Search Section -->
                <div class="row g-3 align-items-end">
                    <div class="col-md-4">
                        <asp:Label Text="Search by Employee ID:" AssociatedControlID="txtSearchEmployeeID" runat="server" CssClass="form-label" />
                        <asp:TextBox ID="txtSearchEmployeeID" runat="server" CssClass="form-control" placeholder="Enter ID to search..." />
                    </div>
                    <div class="col-md-4">
                        <asp:Label Text=" Filter by Date:" AssociatedControlID="txtSearchDate" runat="server" CssClass="form-label" />
                        <asp:TextBox ID="txtSearchDate" runat="server" TextMode="Date" CssClass="form-control" />
                    </div>
                    <div class="col-md-4 d-flex gap-2">
                        <asp:Button ID="btnSearch" runat="server" Text="🔍 Search" CssClass="btn btn-primary flex-fill" OnClick="btnSearch_Click" />
                        <asp:Button ID="btnShowAll" runat="server" Text="👁 Show All" CssClass="btn btn-outline-info flex-fill" OnClick="btnShowAll_Click" />
                        <asp:Button ID="btnGenerateReport" runat="server" Text=" Generate Report" CssClass="btn btn-success flex-fill" OnClick="btnGenerateReport_Click" />
                    </div>
                </div>
            </div>

            <!-- GridView Section -->
            <div class="gridview-container">
                <h2 class="section-title">
                    <i class="fas fa-table"></i>
                    Attendance Records
                </h2>
                <div class="table-responsive">
                    <asp:GridView ID="gvAttendance" runat="server" AutoGenerateColumns="False" DataKeyNames="ID"
                        OnRowCommand="gvAttendance_RowCommand"
                        CssClass="table table-hover align-middle text-center" GridLines="None">
                        <Columns>
                            <asp:BoundField DataField="ID" HeaderText="ID" ReadOnly="True" Visible="false" />
                            <asp:BoundField DataField="EmployeeID" HeaderText="👤 Employee ID" />
                            <asp:BoundField DataField="EmployeeName" HeaderText="📝 Employee Name" />
                            <asp:TemplateField HeaderText=" Date">
                                <ItemTemplate>
                                    <%# Eval("AttendanceDate") != DBNull.Value ? Convert.ToDateTime(Eval("AttendanceDate")).ToString("yyyy-MM-dd") : "N/A" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="🕐 Time In">
                                <ItemTemplate>
                                    <%# Eval("TimeIn") != DBNull.Value ? FormatTime(Eval("TimeIn")) : "N/A" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:TemplateField HeaderText="🕕 Time Out">
                                <ItemTemplate>
                                    <%# Eval("TimeOut") != DBNull.Value ? FormatTime(Eval("TimeOut")) : "N/A" %>
                                </ItemTemplate>
                            </asp:TemplateField>
                            <asp:BoundField DataField="Remarks" HeaderText="💭 Remarks" />
                            <asp:TemplateField HeaderText="⚡ Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="lnkEdit" runat="server" CommandName="EditRecord"
                                        CommandArgument='<%# Container.DataItemIndex %>'
                                        Text="✏ Edit" CssClass="btn btn-sm btn-outline-primary me-2" />
                                    <asp:LinkButton ID="lnkDelete" runat="server" CommandName="DeleteRecord"
                                        CommandArgument='<%# Container.DataItemIndex %>'
                                        Text="🗑 Delete" CssClass="btn btn-sm btn-outline-danger"
                                        OnClientClick="return confirm('⚠ Are you sure you want to delete this record?');" />
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <!-- ReportViewer Section -->
            <div id="reportContainer">
                <h2 class="section-title">
                    <i class="fas fa-chart-bar"></i>
                    Attendance Analytics
                </h2>
                <rsweb:ReportViewer ID="ReportViewer1" runat="server" Width="100%" Height="600px"
                    ProcessingMode="Local" Font-Names="Segoe UI" Font-Size="10pt" />
            </div>

        </div>
    </form>

    <!-- Bootstrap JS -->
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    
    <script>
        // Enhanced form interactions
        document.addEventListener('DOMContentLoaded', function() {
            // Show loading spinner on form submissions
            const buttons = document.querySelectorAll('.btn');
            buttons.forEach(button => {
                button.addEventListener('click', function(e) {
                    if (this.type === 'submit') {
                        setTimeout(() => {
                            document.getElementById('loadingSpinner').style.display = 'block';
                        }, 100);
                    }
                });
            });

            // Add focus animations to form controls
            const inputs = document.querySelectorAll('.form-control');
            inputs.forEach(input => {
                input.addEventListener('focus', function() {
                    this.parentElement.style.transform = 'scale(1.02)';
                });
                
                input.addEventListener('blur', function() {
                    this.parentElement.style.transform = 'scale(1)';
                });
            });

            // Auto-hide messages after 5 seconds
            const messages = document.querySelectorAll('.success-message');
            messages.forEach(message => {
                if (message.style.display !== 'none') {
                    setTimeout(() => {
                        message.style.animation = 'slideUp 0.5s ease-out forwards';
                        setTimeout(() => {
                            message.style.display = 'none';
                        }, 500);
                    }, 5000);
                }
            });

            // Enhanced table row interactions
            const tableRows = document.querySelectorAll('.table tbody tr');
            tableRows.forEach(row => {
                row.addEventListener('mouseenter', function() {
                    this.style.transform = 'translateX(5px)';
                });
                
                row.addEventListener('mouseleave', function() {
                    this.style.transform = 'translateX(0)';
                });
            });

            // Add ripple effect to buttons
            buttons.forEach(button => {
                button.addEventListener('click', function(e) {
                    const ripple = document.createElement('span');
                    const rect = this.getBoundingClientRect();
                    const size = Math.max(rect.width, rect.height);
                    const x = e.clientX - rect.left - size / 2;
                    const y = e.clientY - rect.top - size / 2;
                    
                    ripple.style.cssText = `
                        width: ${size}px;
                        height: ${size}px;
                        left: ${x}px;
                        top: ${y}px;
                        position: absolute;
                        border-radius: 50%;
                        background: rgba(255, 255, 255, 0.4);
                        pointer-events: none;
                        animation: ripple 0.6s ease-out;
                    `;
                    
                    this.style.position = 'relative';
                    this.style.overflow = 'hidden';
                    this.appendChild(ripple);
                    
                    setTimeout(() => {
                        ripple.remove();
                    }, 600);
                });
            });
        });

        // Add ripple animation
        const style = document.createElement('style');
        style.textContent = `
            @keyframes ripple {
                from {
                    transform: scale(0);
                    opacity: 1;
                }
                to {
                    transform: scale(2);
                    opacity: 0;
                }
            }
            
            @keyframes slideUp {
                to {
                    opacity: 0;
                    transform: translateY(-20px);
                }
            }
        `;
        document.head.appendChild(style);
    </script>
</body>
</html>